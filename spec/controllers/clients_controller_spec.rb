require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  it "renders the show view" do
    get :show
    expect(subject).to render_template :show
  end
end
