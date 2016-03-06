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
  {first_name: "Fox", last_name: "Mulder", primary_phone: 7735551234, address: "1801 4th avenue west", city: "seattle", state: "WA"},
  {first_name: "Dana", last_name: "Sculley", primary_phone: 7734441234, address: "325 Broadway E", city: "Seattle", state: "WA"}


]

seed_clients.each do |seed|
  Client.create(seed)
end

seed_workers = [
  {first_name: "Xena", last_name: "Warrior", primary_phone: 7734906700, address: "1992 Oxford Lane", city: "Hoffman Estates", state: "IL"}
]

seed_workers.each do |seed|
  Worker.create(seed)
end

seed_care_pairs = [
  {client_id: 1, worker_id: 1},
  {client_id: 2, worker_id: 1},
]

seed_care_pairs.each do |seed|
  CarePair.create(seed)
end
