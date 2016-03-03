class DistrictsController < ApplicationController
  options = { secure: true }
  socket = PusherClient::Socket.new(ENV["PUSHER_APP_KEY"], options)
  socket.subscribe('provider_sms-development')
  @data = []
  # Bind to a global event (can occur on either channel1 or channel2)
  socket['provider_sms-development'].bind('channelevent') do |data|
    nice_string = data.to_s
    @data.push(nice_string)
  end

  socket.connect

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
