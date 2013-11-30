class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create name: params[:user][:name],
                        email: params[:user][:email],
                        password: params[:user][:password],
                        password_confirmation: params[:user][:password]
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Welcome!"
    else
      render 'new'
    end
  end

end
