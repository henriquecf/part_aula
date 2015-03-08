require 'rails_helper'

RSpec.describe Person, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email) }
    it { should have_many(:enrollments).inverse_of(:person) }
    it { should have_many(:grades).through(:enrollments) }
    it { should have_many(:attendances).inverse_of(:person) }
    it { should have_many(:meetings).through(:attendances) }
    it { should have_many(:child_parents).class_name("ParentChild").with_foreign_key("child_id") }
    it { should have_many(:parent_children).class_name("ParentChild").with_foreign_key("parent_id") }
    it { should have_many(:parents).through(:child_parents) }
    it { should have_many(:children).through(:parent_children) }
    
    describe "valid_email" do
      it "should accept a valid email" do
        person = build(:person, email: "elo@gm.com")
        person.save
        expect(person.errors[:email]).to be_empty
      end
      
      it "should not accept a invalid email" do
        person = build(:person, email: "elo@gmcom")
        person.save
        expect(person.errors[:email]).to eq(["is invalid"])
      end
    end
  end
end
