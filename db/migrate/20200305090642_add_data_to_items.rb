class AddDataToItems < ActiveRecord::Migration[6.0]
  def find_curent_element_in_db

  end

  def get_rand_item
    clothes = ["Shirt", "Pullover", "Socks", "Pants", "Jacket", "Hat", "Cap"]
    sizes = ["XXXS","XXS", "XS", "S", "M","L", "XL", "XXL","XXXL"]
    colors = ["Red", "Black", "White", "Blue", "Green", "Brown"]

    result_items = []
    index = 0
    clothes.each do |clothe|
      sizes.each do |size|
        colors.each do |color|
          if Item.where(["name = ? and size = ? and color = ?",clothe, size, color]).empty?
            temp_item = []
            temp_item[0] = clothe
            temp_item[1] = size
            temp_item[2] = color
            result_items[index] = temp_item
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
