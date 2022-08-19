class Admin::OrdersController < Admin::AdminController
  before_action :find_order, only: %i(show update)
  before_action :load_order_details, only: %i(show)
  before_action :check_status_order, only: %i(update)

  authorize_resource

  def index
    @search = Order.ransack(params[:q])
    @pagy, @orders = pagy @search.result.latest_order
  end

  def show
    respond_to :js
  end

  def update
    if @order.handle_order order_params
      flash[:success] = t(".success")
    else
      flash[:danger] = split_content_error @order.errors[:base]
    end
    redirect_to admin_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

  def load_order_details
    @order_details = @order.order_details.includes(:book)
  end

  def find_order
    @order = Order.find_by id: params[:id]

    return if @order

    flash[:warning] = t ".not_found"
    redirect_to admin_root_path
  end

  def check_status_order
    return if @order.pending? || @order.accepted?

    flash[:danger] = t ".danger"
    redirect_to admin_orders_path
  end
end
