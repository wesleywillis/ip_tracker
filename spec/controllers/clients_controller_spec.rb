require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  before :each do
    @district = District.create(zip_code: "90120")

  end
  describe "GET 'new'" do
    it "responds successfully with a 200 status code" do
      get :new, district_id: @district.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

#  describe "POST 'create'" do
#    it "assigns client model matching lat and long when given address"
#      visit new_district_client_path(District.find(1))
#      fill_in ""
#    end
#  end
end
