require 'rails_helper'

RSpec.describe "grades/new", type: :view do
  before(:each) do
    assign(:grade, Grade.new())
    @insitution = assign(:institution, create(:institution))
  end

  it "renders new grade form" do
    render

    assert_select "form[action=?][method=?]", institution_grades_path(@insitution), "post" do
    end
  end
end
