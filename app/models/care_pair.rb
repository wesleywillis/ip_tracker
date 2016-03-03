class CarePair < ActiveRecord::Base
  belongs_to :client
  belongs_to :worker
  has_many :shifts
end
