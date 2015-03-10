require "rails_helper"

RSpec.describe PeopleController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/institutions/1/people").to route_to("people#index", institution_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/institutions/1/people/new").to route_to("people#new", institution_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/institutions/1/people/1").to route_to("people#show", :id => "1", institution_id: "1")
    end

    it "routes to #edit" do
      expect(:get => "/institutions/1/people/1/edit").to route_to("people#edit", :id => "1", institution_id: "1")
    end

    it "routes to #create" do
      expect(:post => "/institutions/1/people").to route_to("people#create", institution_id: "1")
    end

    it "routes to #update" do
      expect(:put => "/institutions/1/people/1").to route_to("people#update", :id => "1", institution_id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/institutions/1/people/1").to route_to("people#destroy", :id => "1", institution_id: "1")
    end

    it "routes to #relate_parent" do
      expect(:post => "/institutions/1/people/1/parents/2").to route_to("people#relate_parent", :id => "1", institution_id: "1", parent_id: "2")
    end

    it "routes to #parent_search" do
      expect(:get => "/institutions/1/people/1/parents/search").to route_to("people#parent_search", :id => "1", institution_id: "1")
    end

  end
end
