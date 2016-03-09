require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
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

  #describe "POST create" do
  #  it "updates c" do
  #    VCR.use_cassette "client/seattle"
  #    fill_in "first_name", with: "Simon"
  #    fill_in "last_name", with: "Tam"
  #    fill_in "primary_phone", with: 7775554444
  #    fill_in "address", with: "1215 4th Ave #600"
  #    fill_in "city", with: "Seattle"
  #    fill_in "state", with: "WA"
  #    click_on "Save"
  #    expect(Client.last.latitude).to not_eq nil
  #  end
  #end

#  describe "POST 'create'" do
#    it "assigns client model matching lat and long when given address"
#      visit new_district_client_path(District.find(1))
#      fill_in ""
#    end
#  end

  describe "GET 'index'" do
    it "is successful" do
      get :index, district_id: district.id
      expect(response.status).to eq 200
    end
  end
end
