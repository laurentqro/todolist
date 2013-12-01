class UserMailer < ActionMailer::Base
  default from: "laurentcurau@gmail.com"

  def welcome(user)
    @user = user
    @login_url = "http://www.happytodos.herokuapp.com/login"
    mail to: @user.email, subject: "Thank you for signing up"
  end

end
