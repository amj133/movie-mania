class UsersController < ApplicationController

  def show
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id  # start the session
      # will start to go back and forth in cookie - until clear cookies or logout
      redirect_to user_path(user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
