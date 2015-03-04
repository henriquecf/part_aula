require 'rails_helper'

RSpec.describe Meeting, type: :model do
  context "validations" do
    it { should validate_presence_of(:date) }
  end
end
