require 'rails_helper'

RSpec.describe "enrollments/index", type: :view do
  before(:each) do
    assign(:enrollments, [create(:enrollment), create(:enrollment)])
    @institution = assign(:institution, create(:institution))
    @person = assign(:person, create(:person))
  end

  it "renders a list of enrollments" do
    render
    assert_select "tr>td", :text => "Role".to_s, :count => 2
  end
end
