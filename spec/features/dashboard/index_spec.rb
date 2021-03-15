describe "dashboard", type: :feature do
  it "says hello to me" do
    visit '/dashboard/index'

    expect(page).to have_content 'Oh hi'
  end

  it "displays a link to view all recipes" do
    visit '/dashboard/index'

    expect(page).to have_link 'View all recipes'
  end
end
