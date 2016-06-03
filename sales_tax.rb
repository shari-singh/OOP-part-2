class Item
  attr_accessor :name, :num, :start_price, :taxes
  def initilize (name, num, start_price)
    @taxes = 0
    @name = name
    @num = num
    @start_price = start_price
  end
end
