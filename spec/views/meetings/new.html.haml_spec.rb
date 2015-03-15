require 'rails_helper'

RSpec.describe "meetings/new", type: :view do
  before(:each) do
    assign(:meeting, build(:meeting))
    @grade = assign(:grade, create(:grade))
    @institution = assign(:institution, create(:institution))
  end

  it "renders new meeting form" do
    render

    assert_select "form[action=?][method=?]", institution_grade_meetings_path(@institution, @grade), "post" do
    end
  end
end
