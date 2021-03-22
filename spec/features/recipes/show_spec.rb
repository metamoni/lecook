describe 'show recipe', type: :feature do
  let!(:pizza) { create(:recipe, title: 'Pizza', instructions: 'Make dough and add toppings') }

  before do
    visit "/recipes/#{pizza.id}"
  end

  it 'displays recipe with instructions' do
    expect(page).to have_content pizza.title
    expect(page).to have_content pizza.instructions

    expect(page).to have_link 'Destroy'
    expect(page).to have_link 'Edit'
  end
end
