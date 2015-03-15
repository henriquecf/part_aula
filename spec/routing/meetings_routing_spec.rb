require "rails_helper"

RSpec.describe MeetingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/institutions/1/grades/1/meetings").to route_to("meetings#index", institution_id: "1", grade_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/institutions/1/grades/1/meetings/new").to route_to("meetings#new", institution_id: "1", grade_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/institutions/1/grades/1/meetings/1").to route_to("meetings#show", :id => "1", institution_id: "1", grade_id: "1")
    end

    it "routes to #edit" do
      expect(:get => "/institutions/1/grades/1/meetings/1/edit").to route_to("meetings#edit", :id => "1", institution_id: "1", grade_id: "1")
    end

    it "routes to #create" do
      expect(:post => "/institutions/1/grades/1/meetings").to route_to("meetings#create", institution_id: "1", grade_id: "1")
    end

    it "routes to #update" do
      expect(:put => "/institutions/1/grades/1/meetings/1").to route_to("meetings#update", :id => "1", institution_id: "1", grade_id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/institutions/1/grades/1/meetings/1").to route_to("meetings#destroy", :id => "1", institution_id: "1", grade_id: "1")
    end

  end
end
