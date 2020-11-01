class FormulaController < ApplicationController

  def new
  end

  def create
  end

  def show
  end

  private
  
  def formula_params
    params.require(:formula).permit(:name, :hydration, :salt, :starter, :preferment)
  end
end
