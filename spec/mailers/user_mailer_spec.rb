require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "canceled_order" do
    let(:mail) { UserMailer.canceled_order }

    it "renders the headers" do
      expect(mail.subject).to eq("Canceled order")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "complete_order" do
    let(:mail) { UserMailer.complete_order }

    it "renders the headers" do
      expect(mail.subject).to eq("Complete order")
  describe "account_activation" do
    let(:mail) { UserMailer.account_activation }

    it "renders the headers" do
      expect(mail.subject).to eq("Account activation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
