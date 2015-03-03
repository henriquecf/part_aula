require 'rails_helper'

RSpec.describe "grades/index", type: :view do
  before(:each) do
    assign(:grades, [
      Grade.create!(
        :name => "Name",
        :year => 1
      ),
      Grade.create!(
        :name => "Name",
        :year => 1
      )
    ])
  end

  it "renders a list of grades" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
