class Client < ActiveRecord::Base
  belongs_to :district
  has_and_belongs_to_many :workers, :join_table => :care_pairs
end
