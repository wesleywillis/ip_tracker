# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

seed_districts = [
  {zip_code: 98121}
]

seed_districts.each do |seed|
  District.create(seed)
end

seed_clients = [
  {first_name: "Fox", last_name: "Mulder", primary_phone: 7735551234},
  {first_name: "Dana", last_name: "Sculley", primary_phone: 7734441234}


]

seed_clients.each do |seed|
  Client.create(seed)
end

seed_workers = [
  {first_name: "Hailey", last_name: "Willis", primary_phone: 7734906700}
]

seed_workers.each do |seed|
  Worker.create(seed)
end

seed_clients_workers = [
  {client_id: 1, worker_id: 1},
  {client_id: 2, worker_id: 1},
]

seed_clients_workers.each do |seed|
  ClientsWorker.create(seed)
end
