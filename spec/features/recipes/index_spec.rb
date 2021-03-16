describe 'recipes index', type: :feature do
  let!(:hummous) { create(:recipe, title: 'Hummous', instructions: 'Blend chickpeas with tahini') }
  let!(:pizza) { create(:recipe, title: 'Pizza', instructions: 'Make dough and add toppings') }

  before do
    visit '/recipes'
  end

  it 'displays all recipes with instructions' do
    expect(page).to have_content 'All recipes'
    
    expect(page).to have_content pizza.title
    expect(page).to have_content pizza.instructions

    expect(page).to have_content hummous.title
    expect(page).to have_content hummous.instructions

    expect(page).to have_content('View recipe').twice
  end
end