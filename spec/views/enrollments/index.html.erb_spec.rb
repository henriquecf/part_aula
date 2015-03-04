require 'rails_helper'

RSpec.describe "enrollments/index", type: :view do
  before(:each) do
    assign(:enrollments, [
      Enrollment.create!(
        :role => "Role",
        :person => nil,
        :grade => nil
      ),
      Enrollment.create!(
        :role => "Role",
        :person => nil,
        :grade => nil
      )
    ])
  end

  it "renders a list of enrollments" do
    render
    assert_select "tr>td", :text => "Role".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 4
  end
end
