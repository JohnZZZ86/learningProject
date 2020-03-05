store_list = ["ALMI", "EuroOpt", "Korona", "Green", "MySport", "OldSity"]
store_list.each do |name|
  Store.create!(name: name)
end

(1..200).each do
  StoreItem.create!(quantity: rand(1..100), item_id: rand(10..380), store_id: rand(5..10))
end