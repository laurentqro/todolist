class SessionsController < ApplicationController

  def new
    @user = User.create name: "Guest"
    session[:user_id] = @user.id
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    reset_session
    flash[:success] = "You have successfully logged out. Goodbye!"
    redirect_to signin_url
  end

end
