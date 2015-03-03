require 'rails_helper'

RSpec.describe Grade, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:year) }
  end
end
