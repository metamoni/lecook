require 'rails_helper'

RSpec.describe "MealPlans", type: :controller do
  let(:meal_plan) { create(:meal_plan) }

  describe "GET #index" do
    before do
      get :index
    end
  end
end
