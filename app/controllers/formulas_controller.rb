class FormulasController < ApplicationController

  def new
    @formula = Formula.new
  end

  def create
    if logged_in?
      @formula = Formula.new(formula_params)
      if @formula.save
        redirect_to formula_path(@formula)
      else
        render :new
      end
    else
      redirect_to root_path
    end
  end

  def show
    if logged_in?
      @formula = Formula.find(params[:id])
    else
      redirect_to root_path
    end
  end

  private
  
  def formula_params
    params.require(:formula).permit(:name, :hydration, :salt, :starter, :preferment)
  end
end
