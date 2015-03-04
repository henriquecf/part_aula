require 'rails_helper'

RSpec.describe "meetings/edit", type: :view do
  before(:each) do
    @meeting = assign(:meeting, Meeting.create!(
      :grade => nil,
      :date => "2015-02-25"
    ))
  end

  it "renders the edit meeting form" do
    render

    assert_select "form[action=?][method=?]", meeting_path(@meeting), "post" do

      assert_select "input#meeting_grade_id[name=?]", "meeting[grade_id]"
    end
  end
end
