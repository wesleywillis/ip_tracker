class Worker < ActiveRecord::Base
  #has_many :clients, :through => :clients_worker
  has_and_belongs_to_many :clients
end
