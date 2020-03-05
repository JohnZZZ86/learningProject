class AddDataToItems < ActiveRecord::Migration[6.0]

  CLOTHES = ["Shirt", "Pullover", "Socks", "Pants", "Jacket", "Hat", "Cap"]
  SIZES = ["XXXS","XXS", "XS", "S", "M","L", "XL", "XXL","XXXL"]
  COLORS = ["Red", "Black", "White", "Blue", "Green", "Brown"]

  def get_rand_item
    result_items = []
    CLOTHES.each do |clothe|
      SIZES.each do |size|
        COLORS.each do |color|
          if Item.exists?("name = ? and size = ? and color = ?",clothe, size, color)
            result_items << [ clothe, size, color ]
          end
        end
      end
    end
    result_items
  end

  def change
    get_rand_item.each do |name, size, color|
      Item.create(name: name, size: size, color: color)
    end
  end
end
