class RenameClientsworkersToCarepairs < ActiveRecord::Migration
  def change
    rename_table :clients_workers, :care_pairs
  end
end
