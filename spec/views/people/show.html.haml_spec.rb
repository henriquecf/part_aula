require 'rails_helper'

RSpec.describe "people/show", type: :view do
  before(:each) do
    @person = assign(:person, create(:person))
    @institution = assign(:institution, create(:institution))
  end

  it "renders attributes in <p>" do
    render
  end
end
