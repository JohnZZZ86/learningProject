store_list = ["ALMI", "EuroOpt", "Korona", "Green"]

store_list.each do |name|
  Store.create(name: name)
  p store_list.count
  p name
  p Store
end
