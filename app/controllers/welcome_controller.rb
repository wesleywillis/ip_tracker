class WelcomeController < ApplicationController
#  def index
#  @phone = Phone.new
#  end
#
#  def send_text
#    @phone = Phone.new(phone_params)
#    @phone.send_sms(@phone.clean_number)
#    redirect_to :back
#  end
#
#  private
#
#  def phone_params
#    params.require(:phone).permit(:number)
#  end
#end
  def index
    # put your own credentials here
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = 'ENV['TWILIO_AUTH_TOKEN']
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.list({ }).each do |message| 
	     puts message.body
     end

  end
