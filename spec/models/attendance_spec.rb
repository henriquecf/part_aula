require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context "validations" do
    it { should belong_to(:person) }
    it { should belong_to(:meeting) }
  end
end
