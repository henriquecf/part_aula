require 'rails_helper'

RSpec.describe "enrollments/show", type: :view do
  before(:each) do
    @enrollment = assign(:enrollment, create(:enrollment))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Role/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
