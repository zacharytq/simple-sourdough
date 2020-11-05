class FormulasController < ApplicationController
  before_action :require_login
  def new
    @formula = Formula.new
  end

  def index
    if params[:user_id]
      if params[:user_id] == session[:user_id]
        @formulas = Formula.where(author: params[:user_id])
      else
        redirect_to formulas_path
      end
    else
      @formulas = Formula.all
    end
  end

  def create
    @formula = Formula.new(formula_params)
    if @formula.save
      @formula.author = session[:user_id]
      @formula.save
      redirect_to formula_path(@formula)
    else
      render :new
    end
  end

  def show
    @formula = Formula.find(params[:id])
    @bake = @formula.bakes.build
  end

  private
  
  def formula_params
    params.require(:formula).permit(:name, :hydration, :salt, :starter, :preferment)
  end
end
