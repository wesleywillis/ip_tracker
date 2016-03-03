class DistrictsController < ApplicationController
  socket = PusherClient::Socket.new(ENV["PUSHER_APP_KEY"])
  socket.subscribe('provider_sms-development')
#  socket.connect(true)
  @data = []
  # Bind to a global event (can occur on either channel1 or channel2)
#  socket['provider_sms-development'].bind('channelevent') do |data|
#    nice_string = data.to_s
#    @data.push(nice_string)
#  end

  def index
    @districts = District.all
    render :layout => false
  end


  def sms
    socket.connect(true)

    socket['provider_sms-development'].bind('channelevent') do |data|
      nice_string = data.to_s
      @data.push(nice_string)
    end
  if( params['AccountSid'] != ENV["TWILIO_ACCOUNT_SID"] )
     status 401
    else
      Pusher['sms'].trigger('sms_received', {
        :from_number => '...' + params['From'][-4, 4],
        :timestamp => Time.now.strftime("%Y-%m-%dT%H:%M:%S"),
        :text => params['Body']
      })
    end
  #  puts message
    render :nothing => true

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
