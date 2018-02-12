class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username]) # check out params here - you CAN SEE PASSWORD - seems possibly insecure
    if user && user.authenticate(params[:password]) #bcrypt method
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def destroy
    session.clear

    redirect_to login_path
  end

end
