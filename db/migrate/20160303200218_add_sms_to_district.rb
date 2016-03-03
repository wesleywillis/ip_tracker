class AddSmsToDistrict < ActiveRecord::Migration
  def change
    add_column :districts, :sms, :string
  end
end
