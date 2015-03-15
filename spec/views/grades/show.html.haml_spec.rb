require 'rails_helper'

RSpec.describe "grades/show", type: :view do
  before(:each) do
    @grade = assign(:grade, create(:grade))
    @institution = assign(:institution, create(:institution))
  end

  it "renders attributes in <p>" do
    render
  end
end
