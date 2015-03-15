require 'rails_helper'

RSpec.describe "grades/index", type: :view do
  before(:each) do
    assign(:grades, [
      create(:grade),
      create(:grade)
    ])
    assign(:institution, create(:institution))
  end

  it "renders a list of grades" do
    render
  end
end
