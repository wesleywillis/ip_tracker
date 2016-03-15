class CarePair < ActiveRecord::Base
  belongs_to :client
  belongs_to :worker
  has_many :shifts

  def range_alert
    #want admin to recieve alert when 5 shifts in a row have been F for final range
    #want admin alerted when 20 non-consecutive shifts have been F for final range
  end

  def self.dormant_client_ids
    dormant_carepair_records = CarePair.find((CarePair.pluck(:id) - Shift.active_carepairs))
    dormant_carepair_records.map{|cp| cp[:client_id]}.uniq
  end

  def self.all_client_ids
    CarePair.pluck(:client_id).uniq
  end
end
