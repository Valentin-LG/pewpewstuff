require "rails_helper"

RSpec.describe PersonalGearboxesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/personal_gearboxes").to route_to("personal_gearboxes#index")
    end

    it "routes to #show" do
      expect(get: "/personal_gearboxes/1").to route_to("personal_gearboxes#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/personal_gearboxes").to route_to("personal_gearboxes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/personal_gearboxes/1").to route_to("personal_gearboxes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/personal_gearboxes/1").to route_to("personal_gearboxes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/personal_gearboxes/1").to route_to("personal_gearboxes#destroy", id: "1")
    end
  end
end
