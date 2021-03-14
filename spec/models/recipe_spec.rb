require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:recipe) { build(:recipe) }

  it 'is valid with valid attributes' do
    expect(recipe).to be_valid
  end

  it 'is not valid without a title' do
    recipe.title = nil
    expect(recipe).not_to be_valid
    expect(recipe.errors[:title]).to include "can't be blank"
  end

  it 'is not valid without instructions' do
    recipe.instructions = nil
    expect(recipe).not_to be_valid
    expect(recipe.errors[:instructions]).to include "can't be blank"
  end
end
