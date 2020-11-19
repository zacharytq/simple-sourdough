class BakesController < ApplicationController
  before_action :require_login

  def index
    @bakes = Bake.where(user_id: session[:user_id]).order(created_at: :desc)
  end

  def create
    @bake = Bake.new(bake_params)
    if @bake.save
      redirect_to formula_bake_path(@bake.formula, @bake)
    else
      render :new
    end
  end

  def show
    @bake = Bake.find(params[:id])
    unless @bake.user.id == session[:user_id]
      flash[:error] = "You can only view bakes that you created."
      redirect_to bakes_path
    end
    
    if @bake.process.nil?
      render :edit
    else
      render :show
    end
  end

  def update
    @bake = Bake.find_by(id: params[:id])
    @bake.update(bake_params)
    redirect_to bake_path(@bake)
  end

  def edit
    @bake = Bake.find_by(id: params[:id])
    unless @bake.user.id == session[:user_id]
      flash[:error] = "You can only edit bakes you created!"
      redirect_to bakes_path
    end
  end

  def destroy
    bake = Bake.find(params[:id])
    bake.destroy
    redirect_to user_path(current_user)
  end
    

  private
  def bake_params
    params.require(:bake).permit(:formula_id, :process, :total_weight, :user_id)
  end
end
