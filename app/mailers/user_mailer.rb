class UserMailer < ActionMailer::Base
  default from: "laurent@happytodolist.com"

  def welcome(user)
    @user = user
    @signin_url = "http://www.happytodolist.com/signin"
    mail to: @user.email, subject: "Thank you for signing up"
  end

end
