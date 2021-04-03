class IngredientsController < ApplicationController
  before_action :set_recipe, only: %i[destroy]

  def index
    @ingredients = Ingredient.all
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to ingredients_url, notice: 'Ingredient added' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to ingredients_url, notice: 'Ingredient deleted' }
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def set_recipe
    @ingredient = Ingredient.find(params[:id])
  end
end
