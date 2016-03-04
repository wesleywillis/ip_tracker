class DistrictsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :sms
  Pusher.app_id = ENV["PUSHER_APP_ID"]
  Pusher.key = ENV["PUSHER_APP_KEY"]
  Pusher.secret = ENV["PUSHER_APP_SECRET"]
  #socket = PusherClient::Socket.new(ENV["PUSHER_APP_KEY"])
  #socket.subscribe('provider_sms-development')
#  socket.connect(true)
#  @data = []
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
    @district_dummy = District.find_by_id(1)
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
    end

      worker_phone = params['From']
      msg = params['Body']
      msg = msg.downcase

      client_marker = "c"
      worker_marker = "w"
      end_marker = "#"

      client_num = msg[/#{client_marker}(.*?)#{end_marker}/m, 1].to_i
      worker_num = msg[/#{worker_marker}(.*?)#{end_marker}/m, 1].to_i
      check_pair = CarePair.where(client_id: client_num, worker_id: worker_num)
      twilio_client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]
      from_admin = ENV["TWILIO_PHONE"]

      if check_pair.length == 1
        respond_to_worker = "way to go - you are legit!!!  "
      else
        respond_to_worker = "You did not enter a valid worker and client pair"
      end

      twilio_client.account.messages.create(
      :from => from_admin,
      :to => worker_phone,
      :body => "#{respond_to_worker}"
      )


  #    if msg.include?("in")
  #      check_pair = CarePair.where(client_id: client_num, worker_id: worker_num)
  #      #validate stuff
  #      #create a new shift
  #    elsif msg.include?("out")
  #      #validates stuff
  #      #finds the last shift for that carepair
  #      #checks if last shift has a stop time
  #      #updates stoptime if its blank WHICH IT SHOULD BE
  #      #also updates stop_gps, stop_range, final_range
  #    else
  #      #send twilio response that you had a typo
  #    end
  #  end

    @district_dummy.update(sms: msg)
    Shift.create(start_gps: (params['From']), stop_gps: msg)

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
