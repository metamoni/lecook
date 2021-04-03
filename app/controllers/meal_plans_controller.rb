# frozen_string_literal: true

class MealPlansController < ApplicationController
  before_action :set_meal_plan, only: %i[show edit update destroy]

  def new
    @meal_plan = MealPlan.new
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
  end

  def edit; end

  def update
    respond_to do |format|
      if @meal_plan.update(meal_plan_params)
        format.html { redirect_to meal_plan_path(@meal_plan), notice: 'Meal plan updated' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meal_plan.destroy
    respond_to do |format|
      format.html { redirect_to meal_plans_url, notice: 'Meal plan deleted' }
    end
  end

  private

  def set_meal_plan
    @meal_plan = MealPlan.find(params[:id])
  end

  def meal_plan_params
    params.require(:meal_plan).permit(:start_date, :end_date, recipe_ids: [])
  end
end
