require 'rails_helper'

RSpec.describe ClientsController, type: :controller do

  let :district do
    District.create(zip_code: "90120")
  end

  let :client do
    VCR.use_cassette('client_params', :record => :new_episodes) do
      Client.create(first_name: "Eartha", last_name: "Kitt", primary_phone: 2223334444, address: "1215 4th Ave #600", city: "Seattle", state: "WA")
    end
  end

  let (:update_params) do
    VCR.use_cassette('client_update_params', :record => :new_episodes) do
      {
        district_id: district.id,
        client:{
          first_name: "Thomas"
        },
        id: client.id,
      }
    end
  end

  let (:update_params_bad) do
    VCR.use_cassette('client_responses', :record => :new_episodes) do
      {
        district_id: district.id,
        client:{
          first_name: "Thomas", address: nil
        },
        id: client.id,
      }
    end
  end

  let (:good_params) do
    {
      district_id: district.id,
      client:{ first_name: "Simon", last_name: "Tam", primary_phone: 2223334444, address: "1215 4th Ave #600", city: "Seattle", state: "WA"}
    }
  end

  let (:bad_params) do
    {
      district_id: district.id,
      client:{ first_name: "Sonic", last_name: "Hedgehog", primary_phone: 2223334444}
    }
  end

  describe "GET 'index'" do
    it "is successful" do
      get :index, district_id: district.id
      expect(response.status).to eq 200
    end
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
        post :create, good_params
        expect(Client.last.latitude).should_not be_nil
        expect(Client.last).to have_attributes(:first_name => "Simon")
      end
    end

    it "renders new template on error" do
      VCR.use_cassette('client_responses', :record => :new_episodes) do
        post :create, bad_params
        expect(subject).to render_template :new
      end
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, district_id: district.id, id: client.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "renders the show template" do
      get :show, district_id: district.id, id: client.id
      expect(subject).to render_template :show
    end
  end

  describe "GET #edit" do
    it "renders the edit view" do
      get :edit, district_id: district.id, id: client.id
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH #update" do
    it "redirects to show page" do
      patch :update, update_params
      expect(subject).to redirect_to district_client_path(district_id: district.id, id: client.id)
    end
    it "renders edit template on error" do
      patch :update, update_params_bad
      expect(subject).to render_template :edit, district_id: district.id, id: client.id
    end
  end
end
