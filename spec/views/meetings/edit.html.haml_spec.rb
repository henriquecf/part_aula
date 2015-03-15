require 'rails_helper'

RSpec.describe "meetings/edit", type: :view do
  before(:each) do
    @meeting = assign(:meeting, create(:meeting))
    @grade = assign(:grade, create(:grade))
    @institution = assign(:institution, create(:institution))
  end

  it "renders the edit meeting form" do
    render

    assert_select "form[action=?][method=?]", institution_grade_meeting_path(@institution, @grade, @meeting), "post" do
    end
  end
end
