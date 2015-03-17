require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  context "validations" do
    it { should belong_to(:person) }
    it { should belong_to(:grade) }
    it { should validate_presence_of(:role) }
    it { should validate_presence_of(:person_id) }
    it { should validate_presence_of(:grade_id) }
    it { should validate_uniqueness_of(:person_id).scoped_to(:grade_id) }
  end
end
