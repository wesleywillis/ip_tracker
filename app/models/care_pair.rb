class CarePair < ActiveRecord::Base
  belongs_to :client
  belongs_to :worker
  has_many :shifts

  def range_alert
    #want admin to recieve alert when 5 shifts in a row have been F for final range
    #want admin alerted when 20 non-consecutive shifts have been F for final range
  end
end
