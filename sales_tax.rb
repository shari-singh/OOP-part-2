class Items
  attr_accessor :name, :price, :import_tax, :sales_tax
  def initialize (name, price, import_tax, sales_tax)
    @name = name
    @price = price
    @import_tax = import_tax
    @sales_tax = sales_tax
  end
end

class Receipt
  attr_reader :item_list, :tax_total, :receipt_total

  def initialize
    @total_price = []
    @item_list = []
    @receipt_total = 0
    @sum = 0
    @before_tax = []
  end


  def item_tax
    @item_list.each do |item|
    if (item[2] == 'true' && import_tax == 'true')  #charge both import and sales tax if both are true
      # @total += @price * (0.10 + 0.05)
      "1 #{item.name} : #{((@total + item.price)*(0.10+0.05)).round(2)}"
    elsif (item[2] == 'false' && import_tax == 'true') #charge only import tax
      # @total += @price * 0.05
      "1 #{item.name} : #{((@total + item.price)*(0.05)).round(2)}"
    elsif (item[2] == 'true' && import_tax == 'false') #charge only sales tax
      @total += @price * 0.10
      puts "1 #{item.name} : #{((@total + item.price)*(0.10)).round(2)}"
    elsif (item[2] == 'false' && import_tax == 'false') #no tax charge
      puts "1 #{item.name} : #{@total.round(2)}"
    end
  end
  end

  def add(item)
    @before_tax << item.price
    @total_price << @total
  end

  def sum_price
    @before_tax.each do |x|
      @sum += x
    end
    
      @total_price.each do |y|
      @receipt_total += x
    end
  end

  def totals
    puts "Sales taxes:#{@sum.round(2)}"
    puts "Total included taxes: #{@receipt_total.round(2)}"
  end
end

book = Items.new("Book", 12.49, 'false', 'false')
music_cd = Items.new("Music CD", 14.99, 'true', 'false')
choco_bar = Items.new("Chocolate Bar", 0.85, 'false', 'false')
import_choco_box = Items.new("Imported Box of Chocolates", 10, 'false', 'true')
import_perfume = Items.new("Imported Bottle of Perfume", 47.50, 'true', 'true')
import_perfume2 = Items.new("Imported Bottle of Perfume", 32.19, 'true', 'true')
perfume2 = Items.new("Bottle of Perfume", 20.89, 'true', 'false')
headache_pills = Items.new("Packet of Headache Pills", 9.75, 'false', 'false')
import_choco_box2 = Items.new("Imported Box of Chocolates", 11.85, 'false', 'true')

receipt_items1 = []
receipt_items2 = []
receipt_items3 = []

receipt_items1 << [book, music_cd, choco_bar]
receipt_items2 << [import_choco_box, import_perfume]
receipt_items3 << [import_perfume2, perfume2, headache_pills, import_choco_box2]

receipt1 = Receipt.new
receipt1.item_tax
receipt1.sum_price
receipt1.totals
# receipt1.print_items

receipt2 = Receipt.new
receipt3 = Receipt.new
