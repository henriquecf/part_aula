require 'rails_helper'

RSpec.describe "enrollments/edit", type: :view do
  before(:each) do
    @enrollment = assign(:enrollment, create(:enrollment))
    @institution = assign(:institution, create(:institution))
    @person = assign(:person, create(:person))
  end

  it "renders the edit enrollment form" do
    render

    assert_select "form[action=?][method=?]", institution_person_enrollment_path(@institution, @person, @enrollment), "post" do

      assert_select "input#enrollment_role[name=?]", "enrollment[role]"

      assert_select "input#enrollment_grade_id[name=?]", "enrollment[grade_id]"
    end
  end
end
