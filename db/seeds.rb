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
  {first_name: "Ned", last_name: "Stark", primary_phone: 2224441234, address: "1100 2nd Ave", city: "Seattle", state: "WA"},
  {first_name: "Ricki", last_name: "Lake", primary_phone: 2065550198, address: "605 15th Ave E", city: "Seattle", state: "WA"},
  {first_name: "Jon", last_name: "Stewart", primary_phone: 2062349736, address: "1602 32nd Ave", city: "Seattle", state: "WA"},
  {first_name: "Wednesday", last_name: "Addams", primary_phone: 2062949988, address: "1008 E John St", city: "Seattle", state: "WA"},
  {first_name: "Wayne", last_name: "Brady", primary_phone: 2069529827, address: "906 Broadway E", city: "Seattle", state: "WA"},
  {first_name: "Bela", last_name: "Lugosi", primary_phone: 2066829047, address: "1005 E Blaine St", city: "Seattle", state: "WA"},
  {first_name: "Buster", last_name: "Keaton", primary_phone: 2068539420, address: "608 18th Ave E", city: "Seattle", state: "WA"},
  {first_name: "Katherine", last_name: "Deneuve", primary_phone: 2065220092, address: "315 29th Ave E", city: "Seattle", state: "WA"},
  {first_name: "Dale", last_name: "Cooper", primary_phone: 2062850021, address: "3303 E St Andrews Way", city: "Seattle", state: "WA"},
  {first_name: "Tony", last_name: "Danze", primary_phone: 2060119245, address: "2466 25th Ave E", city: "Seattle", state: "WA"},
  {first_name: "Glenn", last_name: "Danzig", primary_phone: 2060948900, address: "1939 15th Ave E", city: "Seattle", state: "WA"},
  {first_name: "John", last_name: "Spartan", primary_phone: 2063326738, address: "404 Federal Ave E", city: "Seattle", state: "WA"}
]

seed_clients.each do |seed|
  Client.create(seed)
end

seed_workers = [
  {first_name: "Xena", last_name: "Warrior", primary_phone: 7734907900, address: "1992 Oxford Lane", city: "Hoffman Estates", state: "IL"},
  {first_name: "Arya", last_name: "Stark", primary_phone: 7734906000, address: "205 Spring St", city: "Seattle", state: "WA"},
  {first_name: "Simon", last_name: "Phoenix", primary_phone: 2068742832, address: "1649 E Olive Way", city: "Seattle", state: "WA"},
  {first_name: "Madeline", last_name: "Ashton", primary_phone: 2063219472, address: "1198 Broadway E", city: "Seattle", state: "WA"},
  {first_name: "Helen", last_name: "Sharp", primary_phone: 2062343423, address: "3837 E Crockett St", city: "Seattle", state: "WA"},
  {first_name: "Johnnie", last_name: "Rico", primary_phone: 2062933824, address: "2125 Broadmoor Dr E", city: "Seattle", state: "WA"},
  {first_name: "John", last_name: "McClane", primary_phone: 2062834824, address: "947 10th Ave E", city: "Seattle", state: "WA"},
  {first_name: "Dwayne", last_name: "Hoover", primary_phone: 2063823945, address: "325 Broadway E", city: "Seattle", state: "WA"},
  {first_name: "RJ", last_name: "Macready", primary_phone: 2063024523, address: "916 20th Ave", city: "Seattle", state: "WA"},
  {first_name: "Rustin", last_name: "Cohle", primary_phone: 2062323498, address: "1718 Summit Ave", city: "Seattle", state: "WA"},
  {first_name: "Martin", last_name: "Hart", primary_phone: 2068273411, address: "1428 19th Ave", city: "Seattle", state: "WA"}
]

seed_workers.each do |seed|
  Worker.create(seed)
end

seed_care_pairs = [
  {client_id: 1, worker_id: 1},
  {client_id: 2, worker_id: 1},
  {client_id: 3, worker_id: 2},
  {client_id: 4, worker_id: 3},
  {client_id: 6, worker_id: 4},
  {client_id: 6, worker_id: 5},
  {client_id: 7, worker_id: 6},
  {client_id: 8, worker_id: 7},
  {client_id: 8, worker_id: 8},
  {client_id: 8, worker_id: 9},
  {client_id: 9, worker_id: 10},
  {client_id: 10, worker_id: 11},
  {client_id: 11, worker_id: 11},
  {client_id: 12, worker_id: 1},
  {client_id: 13, worker_id: 2},
  {client_id: 14, worker_id: 5},
  {client_id: 15, worker_id: 5},
  {client_id: 16, worker_id: 8},
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
