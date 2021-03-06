class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if logged_in?
      redirect_to root_path
    else
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render :new
      end
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
      @bakes = Bake.where(user_id: @user.id).limit(5).order(created_at: :asc)
      
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

end
  
