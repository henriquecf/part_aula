require "rails_helper"

RSpec.describe EnrollmentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/institutions/1/people/1/enrollments").to route_to("enrollments#index", institution_id: "1", person_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/institutions/1/people/1/enrollments/new").to route_to("enrollments#new", institution_id: "1", person_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/institutions/1/people/1/enrollments/1").to route_to("enrollments#show", :id => "1", institution_id: "1", person_id: "1")
    end

    it "routes to #edit" do
      expect(:get => "/institutions/1/people/1/enrollments/1/edit").to route_to("enrollments#edit", :id => "1", institution_id: "1", person_id: "1")
    end

    it "routes to #create" do
      expect(:post => "/institutions/1/people/1/enrollments").to route_to("enrollments#create", institution_id: "1", person_id: "1")
    end

    it "routes to #update" do
      expect(:put => "/institutions/1/people/1/enrollments/1").to route_to("enrollments#update", :id => "1", institution_id: "1", person_id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/institutions/1/people/1/enrollments/1").to route_to("enrollments#destroy", :id => "1", institution_id: "1", person_id: "1")
    end

  end
end
