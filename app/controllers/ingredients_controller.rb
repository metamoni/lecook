class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new
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
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
