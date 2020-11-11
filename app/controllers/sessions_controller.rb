class SessionsController < ApplicationController

  def login
  end

  def create
    if params[:uid]
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
      end

      session[:user_id] = @user.id

      render 'users/show'
    else
      user = User.find_by(name: params[:user_name])
      if user && user.authenticate(params[:user_password])
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        render :login
      end
    end
  end

  def destroy
    if logged_in?
      session.delete :user_id
    end
    redirect_to root_path
  end

  private
  def auth
    request.env['omniauth.auth']
  end

end
