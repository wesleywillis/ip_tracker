require 'rails_helper'

RSpec.describe WorkersController, type: :controller do
  let :district do
    District.create(zip_code: "90120")
  end

  describe "GET 'new'" do
    it "responds successfully with a 200 status code" do
      get :new, district_id: district.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end


  describe "GET 'index'" do
    it "is successful" do
      get :index, district_id: district.id
      expect(response.status).to eq 200
    end
  end
end
