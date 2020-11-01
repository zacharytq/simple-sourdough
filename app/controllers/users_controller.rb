class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if current_user 
  end

  private

  def user_params
    params.require(:user).permit(:name, :password_digest)
  end
end
  
