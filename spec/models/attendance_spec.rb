require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context "validations" do
    it { should belong_to(:person) }
    it { should belong_to(:meeting) }
    it { should validate_presence_of(:person) }
    it { should validate_presence_of(:meeting) }
    it { should validate_presence_of(:present) }
  end
end
