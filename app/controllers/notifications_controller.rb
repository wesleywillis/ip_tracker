class NotificationsController < ApplicationController
  include ActionController::Live

  Mime::Type.register "text/event-stream", :stream

  def index
    response.headers['Content-Type'] = 'text/event-stream'
    begin
        loop do
          response.stream.write "data: #{generate_new_values}\n\n" # Add 2 line breaks to delimitate events
          sleep 5.second
        end
      rescue IOError # Raised when browser interrupts the connection
      ensure
        response.stream.close # Prevents stream from being open forever
    end  
  end
end
