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
      
      it "should get people that have the same last name case insensitive" do
        expect(Person.match_last_name("faria")).to match_array([@person])
      end
    end
    
    describe "name_like" do
      before do
        @person = create(:person, name: "Bruno Faria")
        @other_person = create(:person)
      end
      
      it "should get person when name is set" do
        expect(Person.name_like("Faria")).to match_array([@person])
      end
      
      it "should get person when name is set case insensitive" do
        expect(Person.name_like("faria")).to match_array([@person])
      end
    end
  end
  
  describe "#last_name" do
    it "should return the last name of the person" do
      person = build(:person, name: "Henrique Faria")
      expect(person.last_name).to eq("Faria")
    end
  end
    
  describe "probable_parents" do
    before do
      @person = create(:person, name: "Bruno Faria")
      @probable_parent = create(:person, name: "Emely Faria")
      @not_probable_parent = create(:person, name: "Ivan Morais")
    end
    
    it "should get people that same the same last_name" do
      expect(@person.probable_parents).to include(@probable_parent)
    end
    
    it "should not include the person itself" do
      expect(@person.probable_parents).not_to include(@person)
    end
    
    it "should not include who does not have same last name" do
      expect(@person.probable_parents).not_to include(@not_probable_parent)
    end
  end
end
