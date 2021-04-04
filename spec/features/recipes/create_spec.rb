# frozen_string_literal: true

describe 'create recipe', type: :feature do
  before do
    visit new_recipe_path
  end

  it 'renders create recipe form' do
    expect(page).to have_content 'Add a new recipe'
    expect(page).to have_field 'Title'
    expect(find_trix_editor('recipe_instructions_trix_input_recipe'))
    expect(page).to have_button 'Save recipe'
  end

  it 'shows success message if recipe added' do
    fill_in 'Title', with: 'Tomato sauce'
    fill_in_trix_editor 'recipe_instructions_trix_input_recipe', with: 'Crush tomatoes'

    click_button 'Save recipe'

    expect(page).to have_text 'Recipe added'
    expect(current_path).to eq recipes_path
  end

  it 'warns user when instructions missing' do
    fill_in 'Title', with: 'Tomato sauce'

    click_button 'Save recipe'

    expect(page).to have_text "You can't add a recipe without instructions"
    expect(current_path).to eq new_recipe_path
  end
end
