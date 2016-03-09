require 'rails_helper'

RSpec.describe ClientsController, type: :controller do

  let :district do
    District.create(zip_code: "90120")
  end

  let (:good_params) do
    {
      client:{ first_name: "Simon", last_name: "Tam", primary_phone: 2223334444, address: "1215 4th Ave #600", city: "Seattle", state: "WA"}
    }

  end

  describe "GET 'new'" do
    it "responds successfully with a 200 status code" do
      get :new, district_id: district.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST create" do
    it "adds latitude and longitude to client" do
      VCR.use_cassette('client_responses', :record => :new_episodes) do
        post :create, good_params, district_id: district.id
        expect(Client.last.latitude).should_not be_nil
      end
    end
  end

  describe "GET 'index'" do
    it "is successful" do
      get :index, district_id: district.id
      expect(response.status).to eq 200
    end
  end
end
