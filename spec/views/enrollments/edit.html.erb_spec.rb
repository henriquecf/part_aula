require 'rails_helper'

RSpec.describe "enrollments/edit", type: :view do
  before(:each) do
    @enrollment = assign(:enrollment, create(:enrollment))
  end

  it "renders the edit enrollment form" do
    render

    assert_select "form[action=?][method=?]", enrollment_path(@enrollment), "post" do

      assert_select "input#enrollment_role[name=?]", "enrollment[role]"

      assert_select "input#enrollment_person_id[name=?]", "enrollment[person_id]"

      assert_select "input#enrollment_grade_id[name=?]", "enrollment[grade_id]"
    end
  end
end
