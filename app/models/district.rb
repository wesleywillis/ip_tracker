class District < ActiveRecord::Base
  has_many :clients
  has_many :workers, through: :clients
end
