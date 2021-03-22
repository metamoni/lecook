require 'rails_helper'

RSpec.describe MealPlan, type: :model do
  let(:meal_plan) { create(:meal_plan) }

  it 'is valid with valid attributes' do
    expect(meal_plan).to be_valid
  end

  it 'is not valid without a start date' do
    meal_plan.start_date = nil

    expect(meal_plan).not_to be_valid
    expect(meal_plan.errors[:start_date]).to include "can't be blank"
  end

  it 'is not valid without an end date' do
    meal_plan.end_date = nil

    expect(meal_plan).not_to be_valid
    expect(meal_plan.errors[:end_date]).to include "can't be blank"
  end
end
