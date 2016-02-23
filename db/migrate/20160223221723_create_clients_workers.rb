class CreateClientsWorkers < ActiveRecord::Migration
  def change
    create_table :clients_workers do |t|
      t.integer :client_id
      t.integer :worker_id

      t.timestamps null: false
    end
  end
end
