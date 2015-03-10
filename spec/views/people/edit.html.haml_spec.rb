require 'rails_helper'

RSpec.describe "people/edit", type: :view do
  before(:each) do
    @person = assign(:person, create(:person))
    @institution = assign(:institution, create(:institution))
  end

  it "renders the edit person form" do
    render

    assert_select "form[action=?][method=?]", institution_person_path(@institution, @person), "post" do
    end
  end
end
