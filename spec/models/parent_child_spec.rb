require 'rails_helper'

RSpec.describe ParentChild, type: :model do
  context "validations" do
    it { should validate_presence_of(:parent_id) }
    it { should validate_presence_of(:child_id) }
    it { should belong_to(:parent).class_name("Person") }
    it { should belong_to(:child).class_name("Person") }
    it { should validate_uniqueness_of(:parent_id).scoped_to(:child_id) }
    
    describe "different_child_and_parent" do
      it "should not let equal parent_id and child_id" do
        person = create(:person)
        parent_child = build(:parent_child, parent_id: person.id, child_id: person.id)
        parent_child.save
        expect(parent_child.errors[:child_id]).to eq(["must be different from parent"])
      end
    end
  end
end
