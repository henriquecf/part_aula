require 'rails_helper'

RSpec.describe Meeting, type: :model do
  context "validations" do
    it { should validate_presence_of(:date) }
    it { should have_many(:attendances) }
    it { should have_many(:people).through(:attendances) }
  end
end
