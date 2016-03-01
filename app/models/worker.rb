class Worker < ActiveRecord::Base
  has_many :clients, :through => :clients_workers
end  
