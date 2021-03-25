# frozen_string_literal: true

class MealPlansController < ApplicationController
  def new
    @meal_plan = MealPlan.new
    @recipes = Recipe.all
  end

  def create
    @meal_plan = MealPlan.new(meal_plan_params)

    respond_to do |format|
      if @meal_plan.save
        format.html { redirect_to meal_plans_url, notice: 'Meal plan added' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def index
    @meal_plans = MealPlan.order('start_date ASC')
  end

  def show
    @meal_plan = MealPlan.find(params[:id])
    @recipes = Recipe.all
  end

  private

  def meal_plan_params
    params.require(:meal_plan).permit(:start_date, :end_date, recipe_ids: [])
  end
end
