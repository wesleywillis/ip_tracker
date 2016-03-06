class AddmultipleAddressFields < ActiveRecord::Migration
  def change
    remove_column :clients, :full_street_address
    add_column :clients, :address, :string
    add_column :clients, :city, :string
    add_column :clients, :state, :string
    add_column :workers, :address, :string
    add_column :workers, :city, :string
    add_column :workers, :state, :string
    add_column :workers, :latitude, :float
    add_column :workers, :longitude, :float
  end
end
