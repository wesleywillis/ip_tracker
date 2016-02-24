class FixIntLimit < ActiveRecord::Migration
  def change
    change_column :workers, :primary_phone, :integer, limit: 8
    change_column :clients, :primary_phone, :integer, limit: 8
  end
end
