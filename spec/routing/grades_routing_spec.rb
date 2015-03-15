require "rails_helper"

RSpec.describe GradesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/institutions/1/grades").to route_to("grades#index", institution_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/institutions/1/grades/new").to route_to("grades#new", institution_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/institutions/1/grades/1").to route_to("grades#show", :id => "1", institution_id: "1")
    end

    it "routes to #edit" do
      expect(:get => "/institutions/1/grades/1/edit").to route_to("grades#edit", :id => "1", institution_id: "1")
    end

    it "routes to #create" do
      expect(:post => "/institutions/1/grades").to route_to("grades#create", institution_id: "1")
    end

    it "routes to #update" do
      expect(:put => "/institutions/1/grades/1").to route_to("grades#update", :id => "1", institution_id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/institutions/1/grades/1").to route_to("grades#destroy", :id => "1", institution_id: "1")
    end

  end
end
