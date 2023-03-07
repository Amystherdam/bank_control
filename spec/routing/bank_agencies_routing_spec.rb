require "rails_helper"

RSpec.describe BankAgenciesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/bank_agencies").to route_to("bank_agencies#index")
    end

    it "routes to #new" do
      expect(get: "/bank_agencies/new").to route_to("bank_agencies#new")
    end

    it "routes to #show" do
      expect(get: "/bank_agencies/1").to route_to("bank_agencies#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/bank_agencies/1/edit").to route_to("bank_agencies#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/bank_agencies").to route_to("bank_agencies#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/bank_agencies/1").to route_to("bank_agencies#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/bank_agencies/1").to route_to("bank_agencies#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/bank_agencies/1").to route_to("bank_agencies#destroy", id: "1")
    end
  end
end
