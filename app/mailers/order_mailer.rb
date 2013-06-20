class OrderMailer < ActionMailer::Base
  default :from => "iam@babrovka.ru"

    def order_email(user, order)
      @user = user
      @mail = user.email
      @order  = order
      mail(:to => user.email, :subject => t("your_order_was_created"))
    end
end
