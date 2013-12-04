class UserMailer < ActionMailer::Base
  default from: "\"Happytodolist.com\" <laurent@happytodolist.com>"

  def welcome(user)
    @user = user
    @signin_url = "http://www.happytodolist.com/signin"
    email_with_name = "#{@user.name} <#{@user.email}>"
    mail to: email_with_name, subject: "Thank you for signing up"
  end

end
