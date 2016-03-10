require 'rails_helper'

RSpec.describe DistrictsController, type: :controller do
  let :district do
    District.create(zip_code: "90120")
  end

  describe "GET 'index'" do
    it "is successful" do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      get :show, id: district.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      get :show, id: district.id
      expect(subject).to render_template :show
    end
  end
end
