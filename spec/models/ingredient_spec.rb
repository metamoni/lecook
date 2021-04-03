# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let(:ingredient) { build(:ingredient, name: 'Nutmeg') }

  it 'is valid with valid attributes' do
    expect(ingredient).to be_valid
  end

  it 'is not valid without a name' do
    ingredient.name = nil
    expect(ingredient).not_to be_valid
  end

  it 'is not valid if name already exists' do
    FactoryBot.create(:ingredient, name: 'nutmeg')

    expect(ingredient).not_to be_valid
    expect(ingredient.errors['name']).to include 'has already been taken'
  end
end
