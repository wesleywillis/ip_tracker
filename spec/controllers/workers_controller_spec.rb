require 'rails_helper'

RSpec.describe WorkersController, type: :controller do
  let :district do
    District.create(zip_code: "90120")
  end

  let :worker do
    VCR.use_cassette('worker_responses', :record => :new_episodes) do
      Worker.create(first_name: "Tom", last_name: "Haverford", primary_phone: 2229994444, address: "1219 SW Park Ave", city: "Portland", state: "OR")
    end
  end

  let :client do
    VCR.use_cassette('worker_responses', :record => :new_episodes) do
      Client.create(first_name: "Khal", last_name: "Drogo", primary_phone: 2229994444, address: "1219 SW Park Ave", city: "Portland", state: "OR")
    end
  end

  let (:update_params) do
    {
      district_id: district.id,
      worker:{
        first_name: "Thomas"
      },
    #  clients: [1],
      id: worker.id,
    }
  end

  let (:update_params_bad) do
    {
      district_id: district.id,
      worker:{
        first_name: "Thomas", address: nil
      },
    #  clients: [1],
      id: worker.id,
    }
  end

  let (:good_params) do
    {
      district_id: district.id,
      worker:{ first_name: "Malcolm", last_name: "Reynolds", primary_phone: 7773334444, address: "1000 4th Ave", city: "Seattle", state: "WA"}
    }
  end

  let (:bad_params) do
    {
      district_id: district.id,
      worker:{ first_name: "Donkey", last_name: "Kong", primary_phone: 2223334444}
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
      VCR.use_cassette('worker_responses', :record => :new_episodes) do
        post :create, good_params
        expect(Worker.last.latitude).should_not be_nil
        expect(Worker.last).to have_attributes(:first_name => "Malcolm")
      end
    end
    it "renders new template on error" do
      VCR.use_cassette('worker_responses', :record => :new_episodes) do
        post :create, bad_params
        expect(subject).to render_template :new
      end
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, district_id: district.id, id: worker.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "renders the show template" do
      get :show, district_id: district.id, id: worker.id
      expect(subject).to render_template :show
    end
  end

  describe "GET #edit" do
    it "renders the edit view" do
      get :edit, district_id: district.id, id: worker.id
      expect(subject).to render_template :edit
    end
  end

  describe "PATCH #update" do
    it "redirects to show page" do
      patch :update, update_params
      expect(subject).to redirect_to district_worker_path(district_id: district.id, id: worker.id)
    end
    it "renders edit template on error" do
      patch :update, update_params_bad
      expect(subject).to render_template :edit, district_id: district.id, id: worker.id
    end
  end
end
