#store_list = ["ALMI", "EuroOpt", "Korona", "Green"]
#store_list.each do |name|
#  Store.create!(name: name)
#end

#item_list = [
#    [ "XL", "Shirt" , "Red" ],
#    [ "L", "Boots" , "Black" ],
#    [ "XS", "Socks" , "White" ],
#    [ "XXL", "Pants" , "Blue" ],
#    [ "XXS", "Jacket" , "Green" ],
#    [ "M", "Hat" , "Brown" ],
#    [ "XXXL", "Boots" , "Red" ],
#]
#item_list.each do |size, name, color|
#  Item.create(size: size, name: name, color: color)
#end

store_item_list = [
    [10, 6, 1],
    [20, 5, 2],
    [30, 4, 3],
    [40, 3, 4],
    [50, 2, 1],
    [60, 1, 2],
    [70, 7, 3],
    [80, 6, 4],
    [90, 5, 1],
    [5, 4, 2],
    [15, 3, 4],
    [25, 2, 3],
    [25, 1, 4]
]
store_item_list.each do |quantity, item_id, store_id|
  StoreItem.create!(quantity: quantity, item_id: item_id, store_id: store_id)
end
