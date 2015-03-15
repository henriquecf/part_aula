require 'rails_helper'

RSpec.describe "meetings/index", type: :view do
  before(:each) do
    assign(:meetings, [
      create(:meeting),
      create(:meeting)
    ])
    assign(:grade, create(:grade))
    assign(:institution, create(:institution))
  end

  it "renders a list of meetings" do
    render
  end
end
