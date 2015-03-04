require 'rails_helper'

RSpec.describe "enrollments/new", type: :view do
  before(:each) do
    assign(:enrollment, Enrollment.new(
      :role => "MyString",
      :person => nil,
      :grade => nil
    ))
  end

  it "renders new enrollment form" do
    render

    assert_select "form[action=?][method=?]", enrollments_path, "post" do

      assert_select "input#enrollment_role[name=?]", "enrollment[role]"

      assert_select "input#enrollment_person_id[name=?]", "enrollment[person_id]"

      assert_select "input#enrollment_grade_id[name=?]", "enrollment[grade_id]"
    end
  end
end
