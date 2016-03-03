class DistrictsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :sms
  Pusher.app_id = ENV["PUSHER_APP_ID"]
  Pusher.key = ENV["PUSHER_APP_KEY"]
  Pusher.secret = ENV["PUSHER_APP_SECRET"]
  #socket = PusherClient::Socket.new(ENV["PUSHER_APP_KEY"])
  #socket.subscribe('provider_sms-development')
#  socket.connect(true)
  @data = []
  # Bind to a global event (can occur on either channel1 or channel2)
#  socket['provider_sms-development'].bind('channelevent') do |data|
#    nice_string = data.to_s
#    @data.push(nice_string)
#  end

  def index
    puts "@@@@_____________________________index is here"
    @districts = District.all
    render :layout => false
  end

  def sms
    puts "@@@@_____________________________line 23"
    socket = PusherClient::Socket.new(ENV["PUSHER_APP_KEY"])
    socket.subscribe('provider_sms-development')
    socket.connect(true)
    puts "@@@@_____________________________line 27"
    socket['provider_sms-development'].bind('pusher_internal') do |data|
      puts "@@@@_____________________________line 29"
      #nice_string = data.to_s
      #@data.push(nice_string)
    end
    if( params['AccountSid'] != ENV["TWILIO_ACCOUNT_SID"] )
     status 401
    else
      puts "@@@@_____________________________line 36"
      Pusher['sms'].trigger('sms_received', {
        :from_number => '...' + params['From'][-4, 4],
        :timestamp => Time.now.strftime("%Y-%m-%dT%H:%M:%S"),
        :text => params['Body']
      })
      #@data.push(msg)
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
    params.require(:district).permit(:zip_code, :sms)
  end
end
