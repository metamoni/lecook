class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]

  def index
    @recipes = Recipe.order(created_at: :desc)
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipes_url, notice: "Recipe added" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    # @recipe.image.attach(params[:image])
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
    params.require(:recipe).permit(:title, :instructions, :image)
  end
end
