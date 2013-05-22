class UserMailer < ActionMailer::Base
  default :from => "iam@babrovka.ru"

    def confirm_email(user)
      @user = user
      @mail = user.email
      @url  = "http://example.com/login"
      mail(:to => user.email, :subject => "Your account was confirmed")
    end
end
