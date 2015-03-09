require 'rails_helper'

RSpec.describe Institution, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should have_many(:grades).inverse_of(:institution) }
    it { should have_many(:people).inverse_of(:institution) }
  end
end
