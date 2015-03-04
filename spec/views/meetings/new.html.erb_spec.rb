require 'rails_helper'

RSpec.describe "meetings/new", type: :view do
  before(:each) do
    assign(:meeting, Meeting.new(
      :grade => nil
    ))
  end

  it "renders new meeting form" do
    render

    assert_select "form[action=?][method=?]", meetings_path, "post" do

      assert_select "input#meeting_grade_id[name=?]", "meeting[grade_id]"
    end
  end
end
