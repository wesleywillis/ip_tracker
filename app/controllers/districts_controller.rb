class DistrictsController < ApplicationController
  def index
    @districts = District.all
    render :layout => false
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
