require 'rails_helper'

RSpec.describe Person, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:date_of_birth) }
    it { should validate_presence_of(:institution) }
    it { should validate_inclusion_of(:gender).in_array(%w[M m F f])}
    it { should validate_uniqueness_of(:email).scoped_to(:institution_id) }
    it { should belong_to(:institution) }
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
  
  context "scopes" do
    describe "exclude" do
      before do
        @person = create(:person)
        @other_person = create(:person)
        @excluded_person = create(:person)
      end
      
      it "should exclude one person" do
        expect(Person.exclude(@excluded_person)).not_to include(@excluded_person)
      end
      
      it "should exclude more than one person" do
        people = Person.exclude(@other_person, @excluded_person)
        expect(people).not_to include(@excluded_person)
        expect(people).not_to include(@excluded_person)
      end
    end
    
    describe "matche_last_name" do
      before do
        @person = create(:person, name: "Bruno Faria")
        create(:person)
      end
      
      it "should get people that have the same last name" do
        expect(Person.match_last_name("Faria")).to match_array([@person])
      end
    end
  end
end
