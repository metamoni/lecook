class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: "Recipe deleted." }
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :instructions)
  end
end
