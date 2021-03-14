describe "dashboard", type: :feature do
  it "says hello to me" do
    visit '/dashboard/index'

    expect(page).to have_content 'Oh hi'
  end
end
