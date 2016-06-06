class Item
  attr_accessor :name, :price, :import_tax, :sales_tax

  def initilize (name, price, imported_tax, sales_tax)
    @name = name
    @start_price = start_price.to_f
    @import_tax = import_tax
    @sales_tax = sales_tax

  end

end

class Receipt
  attr_accessor :tax_total, :receipt_total
    @item_list = []
    @tax_total = 0
    @receipt_total = 0

  def print_items
    @item_list.each do |item|
    "1 #{item.name} at #{(item.price + @tax_total).round.to_f/20}"
    end
  end
  
  def tax_total(price, sales_tax, import_tax)
    if (sales_tax == 'true' && import_tax == 'true')  #charge both import and sales tax if both are true
      @tax_total += start_price * (0.10 + 0.05)

    elsif (sales_tax == 'false' && import_tax == 'true') #charge only import tax (9)
      @tax_total += price * 0.05

    elsif (sales_tax == 'true' && import_tax == 'false') #charge only sales tax
      @tax_total += price * 0.10

    elsif (sales_tax == 'false' && import_tax == 'false') #no tax charge
      price
    end
  end
end

book = Items.new("Book", 12.49, 'false', 'false')
music_cd = Items.new("Music CD", 14.99, 'true', 'false')
choco_bar = Items.new("Chocolate Bar", 0.85, 'false', 'false')
import_choco_box = Items.new ("Imported Box of Chocolates", 10, 'false', 'true')
import_perfume = Items.new("Imported Bottle of Perfume", 47.50, 'true', 'true')
import_perfume2 = Items.new ("Imported Bottle of Perfume", 32.19, 'true', 'true')
perfume2 = Items.new("Bottle of Perfume", 20.89, 'true', 'false')
headache_pills = Items.new("Packet of Headache Pills", 9.75, 'false', 'false')
import_choco_box2 = Items.new("Imported Box of Chocolates", 11.85, 'false', 'true')

receipt_items1 = []
receipt_items2 = []
receipt_items3 = []

receipt_items1 << [book, music_cd, choco_bar]
receipt_items2 << [import_choco_box, import_perfume]
receipt_items3 << [import_perfume2, perfume2, headache_pills, import_choco_box2]
