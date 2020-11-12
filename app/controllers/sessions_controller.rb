class SessionsController < ApplicationController

  def login
  end

  def create
    user_info = request.env['omniauth.auth']
    raise user_info.inspect
  end

  def destroy
    if logged_in?
      session.delete :user_id
    end
    redirect_to root_path
  end


end
