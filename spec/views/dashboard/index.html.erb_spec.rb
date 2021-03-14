require 'rails_helper'

RSpec.describe "dashboard/index.html.erb", type: :view do
  it "displays 'Oh hi'" do
    render

    expect(rendered).to have_content 'Oh hi'
  end
end
