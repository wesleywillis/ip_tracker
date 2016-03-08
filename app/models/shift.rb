class Shift < ActiveRecord::Base
  belongs_to :carepair

  def start_in_range?
    shift_gps_string = self.start_gps.split
    shift_gps = shift_gps_string.map! { |x| x.to_f }
    care_pair = self.care_pair_id
    client = CarePair.find(care_pair).client
    client_gps = []
    client_gps.push(client.latitude, client.longitude)

    range = Geocoder::Calculations.distance_between(client_gps, shift_gps)

    if range < 1
      self.update(start_range: true)
    elsif range > 1
      self.update(start_range: false)
    end
  end
end
