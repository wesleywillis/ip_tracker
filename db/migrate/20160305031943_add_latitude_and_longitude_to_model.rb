class AddLatitudeAndLongitudeToModel < ActiveRecord::Migration
  def change
    add_column :clients, :full_street_address, :string
    add_column :clients, :latitude, :float
    add_column :clients, :longitude, :float
  end
end
