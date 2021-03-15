describe 'show recipe', type: :feature do
  let!(:pizza) { create(:recipe, id: 2, title: 'Pizza', instructions: 'Make dough and add toppings') }

  before do
    visit '/recipes/2'
  end

  it 'displays all recipes with instructions' do
    expect(page).to have_content pizza.title
    expect(page).to have_content pizza.instructions

    expect(page).to have_link 'Destroy'
    expect(page).to have_link 'Edit'
  end
end
