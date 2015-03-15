require 'rails_helper'

RSpec.describe "meetings/show", type: :view do
  before(:each) do
    @meeting = assign(:meeting, create(:meeting))
    @grade = assign(:grade, create(:grade))
    @institution = assign(:institution, create(:institution))
  end

  it "renders attributes in <p>" do
    render
  end
end
