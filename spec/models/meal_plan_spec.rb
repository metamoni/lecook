# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MealPlan, type: :model do
  let(:meal_plan) { build(:meal_plan, start_date: '2021-03-01', end_date: '2021-03-07') }

  before do
    travel_to Time.new(2021, 2, 10)
  end

  after do
    travel_back
  end

  it 'is valid with valid attributes' do
    expect(meal_plan).to be_valid
  end

  it 'is not valid without a start date' do
    meal_plan.start_date = nil
    expect(meal_plan).to_not be_valid
    expect(meal_plan.errors[:start_date]).to include "can't be blank"
  end

  it 'is not valid without an end date' do
    meal_plan.end_date = nil
    expect(meal_plan).to_not be_valid
    expect(meal_plan.errors[:end_date]).to include "can't be blank"
  end

  it 'is not valid when start date is in the past' do
    meal_plan.start_date = '2021-02-07'
    expect(meal_plan).to_not be_valid
    expect(meal_plan.errors[:start_date]).to include "can't be in the past"
  end
  
  it 'is not valid when end date is in the past' do
    meal_plan.end_date = '2021-02-09'
    expect(meal_plan).to_not be_valid
    expect(meal_plan.errors[:end_date]).to include "can't be in the past"
  end
end
