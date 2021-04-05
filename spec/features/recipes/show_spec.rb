# frozen_string_literal: true

describe 'show recipe', type: :feature do
  include ActionView::Helpers
  let!(:recipe) { create(:recipe) }

  before do
    visit "/recipes/#{recipe.id}"
  end

  it 'displays recipe with instructions' do
    expect(page).to have_content recipe.title
    expect(page).to have_content recipe.instructions.to_plain_text

    expect(page).to have_link 'Destroy'
    expect(page).to have_link 'Edit'
  end
end
