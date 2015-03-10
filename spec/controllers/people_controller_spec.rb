require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe PeopleController, type: :controller do
  
  before do
    @current_user = create(:user)
    sign_in(@current_user)
  end

  # This should return the minimal set of attributes required to create a valid
  # Person. As you add validations to Person, be sure to
  # adjust the attributes here as well.
  let(:institution) { create(:institution) }
  
  let(:valid_attributes) {
    { name: "Person", gender: "M", email: "person@example.com", date_of_birth: "1990/11/03" }
  }

  let(:invalid_attributes) {
    { name: "" }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PeopleController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all people as @people" do
      person = create(:person)
      get :index, {institution_id: institution.id}, valid_session
      expect(assigns(:people)).to eq([person])
    end
  end

  describe "GET #show" do
    it "assigns the requested person as @person" do
      person = create(:person, institution: institution)
      get :show, {:id => person.to_param, institution_id: institution.id}, valid_session
      expect(assigns(:person)).to eq(person)
    end
  end

  describe "GET #new" do
    it "assigns a new person as @person" do
      get :new, {institution_id: institution.id}, valid_session
      expect(assigns(:person)).to be_a_new(Person)
    end
  end

  describe "GET #edit" do
    it "assigns the requested person as @person" do
      person = create(:person, institution: institution)
      get :edit, {:id => person.to_param, institution_id: institution.id}, valid_session
      expect(assigns(:person)).to eq(person)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Person" do
        expect {
          post :create, {:person => valid_attributes, institution_id: institution.id}, valid_session
        }.to change(Person, :count).by(1)
      end

      it "assigns a newly created person as @person" do
        post :create, {:person => valid_attributes, institution_id: institution.id}, valid_session
        expect(assigns(:person)).to be_a(Person)
        expect(assigns(:person)).to be_persisted
      end

      it "redirects to the created person" do
        post :create, {:person => valid_attributes, institution_id: institution.id}, valid_session
        expect(response).to redirect_to(institution_person_path(institution, Person.last))
      end
      
      it "should have the institution related to it" do
        post :create, {:person => valid_attributes, institution_id: institution.id}, valid_session
        expect(assigns(:person).institution).to eq institution
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved person as @person" do
        post :create, {:person => invalid_attributes, institution_id: institution.id}, valid_session
        expect(assigns(:person)).to be_a_new(Person)
      end

      it "re-renders the 'new' template" do
        post :create, {:person => invalid_attributes, institution_id: institution.id}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: "Person 2", email: "person2@example.com" }
      }

      it "updates the requested person" do
        person = create(:person, institution: institution)
        put :update, {:id => person.to_param, :person => new_attributes, institution_id: institution.id}, valid_session
        person.reload
        expect(person.name).to eq("Person 2")
        expect(person.email).to eq("person2@example.com")
      end

      it "assigns the requested person as @person" do
        person = create(:person, institution: institution)
        put :update, {:id => person.to_param, :person => valid_attributes, institution_id: institution.id}, valid_session
        expect(assigns(:person)).to eq(person)
      end

      it "redirects to the person" do
        person = create(:person, institution: institution)
        put :update, {:id => person.to_param, :person => valid_attributes, institution_id: institution.id}, valid_session
        expect(response).to redirect_to(institution_person_path(institution.id, person.id))
      end
    end

    context "with invalid params" do
      it "assigns the person as @person" do
        person = create(:person, institution: institution)
        put :update, {:id => person.to_param, :person => invalid_attributes, institution_id: institution.id}, valid_session
        expect(assigns(:person)).to eq(person)
      end

      it "re-renders the 'edit' template" do
        person = create(:person, institution: institution)
        put :update, {:id => person.to_param, :person => invalid_attributes, institution_id: institution.id}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested person" do
      person = create(:person, institution: institution)
      expect {
        delete :destroy, {:id => person.to_param, institution_id: institution.id}, valid_session
      }.to change(Person, :count).by(-1)
    end

    it "redirects to the people list" do
      person = create(:person, institution: institution)
      delete :destroy, {:id => person.to_param, institution_id: institution.id}, valid_session
      expect(response).to redirect_to(institution_people_url(institution.id))
    end
  end
  
  describe "POST #relate_parent" do
    before do
      @child = create(:person, institution: institution)
      @parent = create(:person, institution: institution)
      post :relate_parent, id: @child.id, parent_id: @parent.id, institution_id: institution.id
    end
    
    it "should relate @parent as parent of @child" do
      expect(@child.parents).to include(@parent)
    end
    
    it "should relate @parent as parent of @child" do
      expect(@parent.children).to include(@child)
    end
    
    it "should redirect to child" do
      expect(response).to redirect_to(institution_person_path(institution.id, @child))
    end
  end

  describe "GET #parent_search" do
    before do
      @person = create(:person, name: "Bruno Faria", institution: institution)
      @person_with_same_last_name = create(:person, name: "Emely Faria", institution: institution)
      other_person = create(:person, institution: institution)
      get :parent_search, id: @person.id, institution_id: institution.id
    end
    
    it "should render parent_search" do
      expect(response).to render_template(:parent_search)
    end
    
    it "should assign possible_parents" do
      expect(assigns(:people)).to match_array([@person_with_same_last_name])
    end
  end
end
