require "rails_helper"

RSpec.describe HivesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/hives").to route_to("hives#index")
    end

    it "routes to #show" do
      expect(get: "/hives/1").to route_to("hives#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/hives").to route_to("hives#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/hives/1").to route_to("hives#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/hives/1").to route_to("hives#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/hives/1").to route_to("hives#destroy", id: "1")
    end
  end
end
