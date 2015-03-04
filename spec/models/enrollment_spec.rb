require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  context "validations" do
    it { should belong_to(:person) }
    it { should belong_to(:grade) }
    it { should validate_presence_of(:role) }
    it { should validate_presence_of(:person) }
    it { should validate_presence_of(:grade) }
  end
end
