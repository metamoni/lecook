describe 'create recipe', type: :feature do
  before do
    visit new_recipe_path
  end

  it 'renders create recipe form' do
    expect(page).to have_content 'Add a new recipe'
    expect(page).to have_field 'Image'
    expect(page).to have_field 'Title'
    expect(page).to have_field 'Instructions'
    expect(page).to have_button 'Save recipe'
    expect(page).to have_link 'Back'
  end

  it 'shows success message if recipe added' do
    fill_in 'Title', with: 'Tomato sauce'
    fill_in 'Instructions', with: 'Crush tomatoes'

    click_button 'Save recipe'

    expect(current_path).to eq recipes_path
  end
end
