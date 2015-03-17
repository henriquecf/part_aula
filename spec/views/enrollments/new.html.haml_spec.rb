require 'rails_helper'

RSpec.describe "enrollments/new", type: :view do
  before(:each) do
    assign(:enrollment, build(:enrollment))
    @institution = assign(:institution, create(:institution))
    @person = assign(:person, create(:person))
  end

  it "renders new enrollment form" do
    render

    assert_select "form[action=?][method=?]", institution_person_enrollments_path(@institution, @person), "post" do

      assert_select "input#enrollment_role[name=?]", "enrollment[role]"

      assert_select "input#enrollment_grade_id[name=?]", "enrollment[grade_id]"
    end
  end
end
