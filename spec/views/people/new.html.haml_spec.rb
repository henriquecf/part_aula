require 'rails_helper'

RSpec.describe "people/new", type: :view do
  before(:each) do
    assign(:person, Person.new())
    @institution = assign(:institution, create(:institution))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", institution_people_path(@institution), "post" do
    end
  end
end
