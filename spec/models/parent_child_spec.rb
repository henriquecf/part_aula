require 'rails_helper'

RSpec.describe ParentChild, type: :model do
  context "validations" do
    it { should belong_to(:parent).class_name("Person") }
    it { should belong_to(:child).class_name("Person") }
    it { should validate_uniqueness_of(:parent_id).scoped_to(:child_id) }
  end
end
