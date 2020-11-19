class SessionsController < ApplicationController

  def login
  end

  def create
    user_info = request.env['omniauth.auth']

    if user_info
      @user = User.where(uid: user_info[:uid]).first_or_create do |u|
        u.name = user_info[:info][:name]
        u.password = SecureRandom.hex
      end
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @user = User.find_by(name: params[:user_name])
      if @user && @user.authenticate(params[:user_password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:login_error] = "Incorrect Username or Password!"
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
