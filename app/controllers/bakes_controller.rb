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
  end

  private
  def bake_params
    params.require(:bake).permit(:formula_id, :total_weight, :user_id)
  end
end
