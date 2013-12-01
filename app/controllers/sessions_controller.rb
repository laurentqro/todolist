class SessionsController < ApplicationController

  def new
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
    redirect_to root_url
  end

end
