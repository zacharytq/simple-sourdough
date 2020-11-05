class SessionsController < ApplicationController

  def login
  end

  def create
    user = User.find_by(name: params[:user_name])
    if user && user.authenticate(params[:user_password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :login
    end
  end

  def destroy
    if logged_in?
      session.delete :user_id
    end
    redirect_to root_path
  end

end
