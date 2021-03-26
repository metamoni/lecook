# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MealPlansController, type: :controller do
  before do
    travel_to Time.new(2021, 2, 10)
  end

  after do
    travel_back
  end

  describe 'GET #index' do
    let!(:meal_plan_1) { create(:meal_plan, start_date: '2021-03-14', end_date: '2021-03-24') }
    let!(:meal_plan_2) { create(:meal_plan, start_date: '2021-03-01', end_date: '2021-03-11') }
    let!(:meal_plan_3) { create(:meal_plan, start_date: '2021-03-07', end_date: '2021-03-17') }

    before do
      get :index
    end

    it 'assigns all meal plans by start date' do
      expect(assigns[:meal_plans]).to eq [meal_plan_2, meal_plan_3, meal_plan_1]
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) { { start_date: '2021-03-30', end_date: '2021-04-09' } }

      before do
        post :create, params: { meal_plan: valid_params }
      end

      it 'saves new meal plan to database' do
        expect(MealPlan.count).to eq 1
      end

      it 'displays flash message' do
        expect(flash[:notice]).to eq 'Meal plan added'
      end

      it 'redirects to meal plans' do
        expect(controller).to redirect_to meal_plans_url
      end
    end
  end
end
