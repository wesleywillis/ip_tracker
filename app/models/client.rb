class Client < ActiveRecord::Base
  belongs_to :district
  has_and_belongs_to_many :workers, :join_table => :care_pairs

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true

  def full_street_address
    [address, city, state].compact.join(', ')
  end

  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  after_save :geocode

  def dormant_case
    #want to issue alert if client has no workers
    #want to issue alert if client has not had and workers register shifts with them for 7 days
  end
end
