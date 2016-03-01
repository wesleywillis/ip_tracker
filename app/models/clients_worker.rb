class ClientWorker < ActiveRecord::Base
  belongs_to :client
  belongs_to :worker
end
