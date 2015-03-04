require 'rails_helper'

RSpec.describe "meetings/show", type: :view do
  before(:each) do
    @meeting = assign(:meeting, Meeting.create!(
      :grade => nil,
      :date => "2015-02-25"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
