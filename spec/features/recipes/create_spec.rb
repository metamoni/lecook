describe 'create recipe', type: :feature do
  before do
    visit "/recipes/new"
  end

  it 'renders create recipe form' do
    expect(page).to have_content 'Add a new recipe'
    expect(page).to have_field 'Image'
    expect(page).to have_field 'Title'
    expect(page).to have_field 'Instructions'
    expect(page).to have_button 'Save recipe'
    expect(page).to have_link 'Back'
  end

  it 'redirects to recipes index after recipe added' do
    fill_in 'Title', with: 'Tomato sauce'
    fill_in 'Instructions', with: 'Crush tomatoes'

    click_button 'Save recipe'

    expect(current_path).to eq recipes_path
  end

  # TO DO: Add required fields test

  # TO DO: Uncomment once controller is updated
  # it 'does not redirect if title missing' do
  #   fill_in 'Instructions', with: 'Crush tomatoes'

  #   click_button 'Save recipe'

  #   current_path.should == new_recipe_path
  # end
end
