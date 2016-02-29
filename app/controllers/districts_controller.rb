class DistrictsController < ApplicationController
  def index
    @districts = District.all
  end

  def show
    id = params[:id]
    @district = District.find(id)
  end

  private

  def district_params
    params.require(:district).permit(:zip_code)
  end
end
