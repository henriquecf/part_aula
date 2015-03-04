require 'rails_helper'

RSpec.describe "meetings/index", type: :view do
  before(:each) do
    assign(:meetings, [
      Meeting.create!(
        :grade => nil,
        :date => "2015-02-25"
      ),
      Meeting.create!(
        :grade => nil,
        :date => "2015-03-04"
      )
    ])
  end

  it "renders a list of meetings" do
    render
    assert_select "tr>td", :text => "2015-02-25", :count => 1
    assert_select "tr>td", :text => "2015-03-04", :count => 1
  end
end
