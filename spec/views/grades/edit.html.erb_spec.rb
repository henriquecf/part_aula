require 'rails_helper'

RSpec.describe "grades/edit", type: :view do
  before(:each) do
    @grade = assign(:grade, Grade.create!(
      :name => "MyString",
      :year => 1
    ))
  end

  it "renders the edit grade form" do
    render

    assert_select "form[action=?][method=?]", grade_path(@grade), "post" do

      assert_select "input#grade_name[name=?]", "grade[name]"

      assert_select "input#grade_year[name=?]", "grade[year]"
    end
  end
end
