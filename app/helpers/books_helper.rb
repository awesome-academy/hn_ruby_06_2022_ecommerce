module BooksHelper
  def search
    search_text = params[:search_text]
    @books = if search_text.blank?
               Book.all
             else
               Book.search(search_text)
             end
    render :home
  end

  def render_star star
    temp = []
    star = star.to_i
    star.times do |_n|
      temp << '<i class="fa fa-star" aria-hidden="true"></i>'.html_safe
    end
    (5 - star).times do |_n|
      temp << '<i class="fa fa-star-o" aria-hidden="true"></i>'.html_safe
    end
    safe_join(temp)
  end

  def update_rate
    return unless @comment.save

    comment_book = @comment.book
    numerator =
      comment_book.rate_avg * (comment_book.comments.length - 1) + @comment.rate
    denominator = comment_book.comments.length
    new_rate_avg = numerator / denominator
    comment_book.update_columns rate_avg: new_rate_avg
  end
end
