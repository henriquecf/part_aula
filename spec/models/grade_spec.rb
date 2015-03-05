require 'rails_helper'

RSpec.describe Grade, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:institution) }
    it { should validate_uniqueness_of(:name).scoped_to(:year) }
    it { should belong_to(:institution) }
    it { should have_many(:enrollments).inverse_of(:grade) }
    it { should have_many(:people).through(:enrollments) }
    it { should have_many(:meetings).inverse_of(:grade) }
  end
end
