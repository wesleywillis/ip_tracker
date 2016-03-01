class Client < ActiveRecord::Base
  belongs_to :district
  #has_many :workers, :through => :clients_workers
  has_and_belongs_to_many :workers
end
