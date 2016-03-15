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
  {first_name: "Dana", last_name: "Sculley", primary_phone: 7734441234, address: "325 Broadway E", city: "Seattle", state: "WA"},
  {first_name: "River", last_name: "Tam", primary_phone: 5554441234, address: "1215 4th Ave", city: "Seattle", state: "WA"},
  {first_name: "Bran", last_name: "Stark", primary_phone: 2224441234, address: "1100 2nd Ave", city: "Seattle", state: "WA"},
  {first_name: "Ned", last_name: "Stark", primary_phone: 2224441234, address: "1100 2nd Ave", city: "Seattle", state: "WA"}
]

seed_clients.each do |seed|
  Client.create(seed)
end

seed_workers = [
  {first_name: "Xena", last_name: "Warrior", primary_phone: 7734906700, address: "1992 Oxford Lane", city: "Hoffman Estates", state: "IL"},
  {first_name: "Arya", last_name: "Stark", primary_phone: 7734906700, address: "205 Spring St", city: "Seattle", state: "WA"}
]

seed_workers.each do |seed|
  Worker.create(seed)
end

seed_care_pairs = [
  {client_id: 1, worker_id: 1},
  {client_id: 2, worker_id: 1},
  {client_id: 3, worker_id: 2},
  {client_id: 4, worker_id: 2},
]

seed_care_pairs.each do |seed|
  CarePair.create(seed)
end

seed_shifts = [
  {care_pair_id: 2, start_gps: "47.60754754309642 -122.33484121632847", start_range: false, stop_time: nil, stop_gps: "47.607504429351174 -122.33445328261953", stop_range: false, final_range: false, created_at: "2016-03-15 00:31:43", updated_at: "2016-03-15 00:36:36", gps_id: "2e4a1a4a19e278f35a8d2eb1", shift_minutes: 4.882783183333333, alert_admin: true},
  {care_pair_id: 2, start_gps: "47.60754754309642 -122.33484121632847", start_range: false, stop_time: nil, stop_gps: "47.607504429351174 -122.33445328261953", stop_range: false, final_range: false, created_at: "2016-03-14 00:31:43", updated_at: "2016-03-14 00:56:36", gps_id: "2e4a1a4a19e278f35a8d2eb1", alert_admin: true},
  {care_pair_id: 2, start_gps: "47.60754754309642 -122.33484121632847", start_range: false, stop_time: nil, stop_gps: "47.607504429351174 -122.33445328261953", stop_range: false, final_range: false, created_at: "2016-03-14 00:31:43", updated_at: "2016-03-14 00:56:36", gps_id: "2e4a1a4a19e278f35a8d2eb1", alert_admin: true},
  {care_pair_id: 1, start_gps: "47.607557624611836 -122.33456514080474", start_range: false, stop_time: nil, stop_gps: "47.6075000457898 -122.33457541259827", stop_range: false, final_range: false, created_at: "2016-03-15 00:44:53", updated_at: "2016-03-15 00:47:29", gps_id: "cfd14aaea6a8fadc18cfc1fd", shift_minutes: 2.6073864166666665, alert_admin: true},
  {care_pair_id: 1, start_gps: "47.607557624611836 -122.33456514080474", start_range: false, stop_time: nil, stop_gps: "47.6075000457898 -122.33457541259827", stop_range: false, final_range: false, created_at: "2016-03-14 00:44:53", updated_at: "2016-03-14 00:47:29", gps_id: "cfd14aaea6a8fadc18cfc1fd", shift_minutes: 2.6073864166666665, alert_admin: true},
  {care_pair_id: 3, start_gps: "47.607580405152675 -122.33470378592624", start_range: true, stop_time: nil, stop_gps: "47.607535027721546 -122.33457639506892", stop_range: true, final_range: true, created_at: "2016-03-15 01:13:24", updated_at: "2016-03-15 01:15:35", gps_id: "650202180aad47f94bb0066e", shift_minutes: 2.19334565, alert_admin: false},
  {care_pair_id: 3, start_gps: "47.607580405152675 -122.33470378592624", start_range: true, stop_time: nil, stop_gps: "47.607535027721546 -122.33457639506892", stop_range: true, final_range: true, created_at: "2016-03-13 01:13:24", updated_at: "2016-03-13 01:15:35", gps_id: "650202180aad47f94bb0066e", shift_minutes: 2.19334565, alert_admin: false},
]

seed_shifts.each do |seed|
  Shift.create(seed)
end
