class NotificationsController < ApplicationController
  include ActionController::Live

  Mime::Type.register "text/event-stream", :stream

  def index
    response.headers['Content-Type'] = 'text/event-stream'
    # Stream content here
  end
end
