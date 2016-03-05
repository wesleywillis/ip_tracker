class DistrictsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:sms, :gps]
  Pusher.app_id = ENV["PUSHER_APP_ID"]
  Pusher.key = ENV["PUSHER_APP_KEY"]
  Pusher.secret = ENV["PUSHER_APP_SECRET"]

  def index
    puts "@@@@_____________________________index is here"
    @districts = District.all
    @workers = Worker.all
    @clients = Client.all
    render :layout => false
  end

  def gps
    #new_shift = Shift.where(gps_id: params[:request_id])
    if params[:progress] == "located"
      new_shift = Shift.where(gps_id: params[:request_id])
      new_shift.last.update(start_gps: params[:progress])
    end
    render :nothing => true
  end

  def sms
    socket = PusherClient::Socket.new(ENV["PUSHER_APP_KEY"])
    socket.subscribe('provider_sms-development')
    socket.connect(true)

    #not sure what's going on below but it was part of the doc directions, code seems to not be getting hit
    socket['provider_sms-development'].bind('pusher_internal') do |data|
      #nice_string = data.to_s
      #@data.push(nice_string)
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
        shift_pair = check_pair[0].id
        if msg.include?("in")
          headers ={"x-user-id"=> ENV['PINLOGIC_CLIENT_ID'], "x-auth-token"=> ENV["PINLOGIC_AUTH_TOKEN"]}
          pin_response = HTTParty.post("https://api.pinlogic.co/locate/request/",:headers => headers)
          pin_data = JSON.parse(pin_response.body)
          pin_url = pin_data['request_url']
          gps_id = pin_data['request_id']
          respond_to_worker = "Thank you for checking IN --- HERE IS A FAKE PINLOGIC LINK #{pin_url}"
          Shift.create(care_pair_id: shift_pair, gps_id: gps_id)
        elsif msg.include?("out")
          respond_to_worker = "Thank you for checking OUT --- HERE IS A FAKE PINLOGIC LINK"
        #  open_shift = Shift.where(care_pair_id: shift_pair, stop_gps: nil)
        #  open_shift.last.update(stop_gps: msg)
        else
          respond_to_worker = "please make sure to include an 'in' or 'out' command in your text "
        end


      else
        respond_to_worker = "You did not enter a valid worker and client pair"
      end

      twilio_client.account.messages.create(
      :from => from_admin,
      :to => worker_phone,
      :body => "#{respond_to_worker}"
      )

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
