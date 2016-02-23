class Client < ActiveRecord::Base
  belongs_to :district
  has_many :workers, :through => :clients_workers
end
