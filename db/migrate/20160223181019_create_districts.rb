class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
