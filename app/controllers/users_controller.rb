class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create name: params[:user][:name],
                        email: params[:user][:email],
                        password: params[:user][:password],
                        password_confirmation: params[:user][:password_confirmation]

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        UserMailer.welcome(@user).deliver

        format.html { redirect_to root_url }
      else
        format.html { render 'new' }
      end
    end
  end

  def edit
    @user = User.find_by(id: session[:user_id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @user = User.find_by(id: session[:user_id])
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    @user.save
    redirect_to root_url
  end

end
