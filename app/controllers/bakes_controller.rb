class BakesController < ApplicationController
  before_action :require_login
  def create
    @bake = Bake.new(bake_params)
    @bake.user_id = session[:user_id]
    if @bake.save
      redirect_to formula_bake_path(@bake.formula, @bake)
    else
      render :new
    end
  end

  def show
    @bake = Bake.find(params[:id])
  end

  private
  def bake_params
    params.require(:bake).permit(:formula_id, :total_weight)
  end
end
