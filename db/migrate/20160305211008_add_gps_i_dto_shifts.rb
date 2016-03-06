class AddGpsIDtoShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :gps_id, :string
  end
end
