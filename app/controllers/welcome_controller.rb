class WelcomeController < ApplicationController
  def index
    twiml = Twilio::TwiML::Response.new do |r|
    r.Message "Hey Monkey. Thanks for the message!"
    end
    @text_back = twiml.text
  end
end
