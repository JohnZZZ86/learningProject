class AddDataToItems < ActiveRecord::Migration[6.0]
  def get_rand_item
    CLOTHES = ["Shirt", "Pullover", "Socks", "Pants", "Jacket", "Hat", "Cap"]
    SIZES = ["XXXS","XXS", "XS", "S", "M","L", "XL", "XXL","XXXL"]
    COLORS = ["Red", "Black", "White", "Blue", "Green", "Brown"]

    result_items = []
    index = 0
    CLOTHES.each do |clothe|
      SIZES.each do |size|
        COLORS.each do |color|
          if Item.exists("name = ? and size = ? and color = ?",clothe, size, color).empty?
            result_items << [ clothe, size, color ]
            index += 1
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
