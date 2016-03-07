class Client < ActiveRecord::Base
  belongs_to :district
  has_and_belongs_to_many :workers, :join_table => :care_pairs

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true

  def full_street_address
    [address, city, state].compact.join(', ')
  end

  geocoded_by :full_street_address
  #after_validation :geocode          
  after_save :geocode
end
