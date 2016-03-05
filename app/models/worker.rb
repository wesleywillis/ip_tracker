class Worker < ActiveRecord::Base
  has_and_belongs_to_many :clients, :join_table => :care_pairs
end
