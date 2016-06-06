class Item
  attr_accessor :name, :quantity, :start_price, :import_tax, :sales_tax

  def initilize (name, quantity, start_price, imported)
    @name = name
    @quantity = quantity.to_i
    @start_price = start_price.to_f
    @import_tax = import_tax
    @sales_tax = sales_tax

  end

end

class Receipt
  attr_accessor :tax_exempt, :tax_total, :receipt_total

  def initilize (tax_exempt)
    @tax_exempt = tax_exempt
    @tax_total = 0
    @total = 0
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


(end

class Imported > Item

end
