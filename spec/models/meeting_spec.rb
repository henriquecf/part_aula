require 'rails_helper'

RSpec.describe Meeting, type: :model do
  context "validations" do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:grade) }
    it { should belong_to(:grade) }
    it { should have_many(:attendances).inverse_of(:meeting) }
    it { should have_many(:people).through(:attendances) }
    it { should accept_nested_attributes_for(:attendances) }
  end
end
