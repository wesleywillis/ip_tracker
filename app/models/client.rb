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

  def self.dormant_cases
    clients = Client.all
    dormant_hash = {}
    clients.each do |client|
      recent_count = 0
      pairs = CarePair.where(client_id: client)
      if pairs.count == 0
        dormant_hash[client] = 0
      else
        pairs.each do |pair|
          recent = pair.shifts.where(updated_at: 1.week.ago..Date.today)
          recent_count += recent.count
        end
      end
      if recent_count > 0
        dormant_hash[client] = 0
      end
    end
    return dormant_hash
  end
end
