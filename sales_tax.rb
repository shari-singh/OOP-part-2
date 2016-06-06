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

