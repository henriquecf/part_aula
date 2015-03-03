require 'rails_helper'

RSpec.describe Grade, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:year) }
    it { should validate_uniqueness_of(:name).scoped_to(:year) }
  end
end
