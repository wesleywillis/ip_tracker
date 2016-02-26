module Messenger

  def send_sms(number)
    acct_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new acct_sid, auth_token

    from = '+17734821550'

    message = @client.account.messages.create(
        :from => from,
        :to => '+1'+number,
        :body => 'Work Hard. Do Good. Change the World. http://bit.ly/1VWLByF'
        )
  end

end
