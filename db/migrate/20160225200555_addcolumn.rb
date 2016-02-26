class Addcolumn < ActiveRecord::Migration
  def change
    add_column :phones, :number, :string
  end
end
