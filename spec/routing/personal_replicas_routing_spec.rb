require "rails_helper"

RSpec.describe PersonalReplicasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/personal_replicas").to route_to("personal_replicas#index")
    end

    it "routes to #show" do
      expect(get: "/personal_replicas/1").to route_to("personal_replicas#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/personal_replicas").to route_to("personal_replicas#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/personal_replicas/1").to route_to("personal_replicas#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/personal_replicas/1").to route_to("personal_replicas#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/personal_replicas/1").to route_to("personal_replicas#destroy", id: "1")
    end
  end
end
