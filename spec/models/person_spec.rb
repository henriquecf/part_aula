require 'rails_helper'

RSpec.describe Person, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email) }
    it { should have_many(:enrollments) }
    it { should have_many(:grades).through(:enrollments) }
    it { should have_many(:attendances) }
    it { should have_many(:meetings).through(:attendances) }
  end
end
