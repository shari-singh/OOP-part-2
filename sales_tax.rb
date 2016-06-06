class Item
  attr_accessor :name, :price, :import_tax, :sales_tax, :total
  def initialize (name, price, import_tax, sales_tax)
    @name = name
    @price = price
    @total
    @import_tax = import_tax
    @sales_tax = sales_tax
  end
end

class Receipt
  attr_reader :receipt_total, :before_tax, :sum

  def initialize
    @total_price = []
    @item_list = []
    @total = 0
    @receipt_total = 0
    @sum = 0
    @before_tax = []
  end

  def add_item(item)
    if item != nil
      @item_list << item
    end
  end

  def item_tax
    @item_list.each do |item|
    if (item.sales_tax == 'true' && import_tax == 'true')  #charge both import and sales tax if both are true
      item.total += item.price * (0.10 + 0.05)

    elsif (item.sales_tax == 'false' && import_tax == 'true') #charge only import tax
      item.total += item.price * 0.05

    elsif (item.sales_tax == 'true' && import_tax == 'false') #charge only sales tax
      item.total += item.price * 0.10

    elsif (item.sales_tax == 'false' && import_tax == 'false') #no tax charge
      item.price

    end
  end
  end

  def list
    @item_list.each do |items|
      puts "puts 1 #{items.name}: $#{items.price}"
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
    puts "Sales taxes:#{@sum.to_f/20}"
    puts "Total included taxes: #{@receipt_total.to_f/20}"
  end
end

receipt1 = Receipt.new
receipt2 = Receipt.new
receipt3 = Receipt.new

music_cd = Item.new("Music CD", 14.99, true, false)
choco_bar = Item.new("Chocolate Bar", 0.85, false, false)
import_choco_box = Item.new("Imported Box of Chocolates", 10, false, true)
import_perfume = Item.new("Imported Bottle of Perfume", 47.50, true, true)
import_perfume2 = Item.new("Imported Bottle of Perfume", 32.19, true, true)
perfume2 = Item.new("Bottle of Perfume", 20.89, true, false)
headache_pills = Item.new("Packet of Headache Pills", 9.75, false, false)
import_choco_box2 = Item.new("Imported Box of Chocolates", 11.85, false, true)

book = Item.new("Book", 12.49, false, false)

puts "-------- Receipt 1 ------------"
receipt1.add_item(book)
receipt1.add_item(music_cd)
receipt1.add_item(choco_bar)
receipt1.item_tax
receipt1.list
receipt1.sum_price
receipt1.totals

puts "-------- Receipt 2 ------------"
receipt2.add_item(import_choco_box)
receipt2.add_item(import_perfume)
receipt2.item_tax
receipt2.list
receipt2.sum_price
receipt2.totals

puts "-------- Receipt 3 ------------"
receipt3.add_item(import_perfume2)
receipt3.add_item(perfume2)
receipt3.add_item(headache_pills)
receipt3.add_item(import_choco_box2)
receipt3.item_tax
receipt3.list
receipt3.sum_price
receipt3.totals
