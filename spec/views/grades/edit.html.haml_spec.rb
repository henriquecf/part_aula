require 'rails_helper'

RSpec.describe "grades/edit", type: :view do
  before(:each) do
    @grade = assign(:grade, create(:grade))
    @institution = assign(:institution, create(:institution))
  end

  it "renders the edit grade form" do
    render

    assert_select "form[action=?][method=?]", institution_grade_path(@institution, @grade), "post" do
    end
  end
end
