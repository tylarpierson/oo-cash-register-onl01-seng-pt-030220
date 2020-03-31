class CashRegister 
  attr_accessor :total, :discount, :title 
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end 
  def discount 
    @discount
  end 
  def add_item(item, price, quantity = 1)
    item_info = {}
    item_info[:name] = item
    item_info[:price] = price
    item_info[:quantity] = quantity

    @items<< item_info

    @total += price * quantity
  end 
  def apply_discount 
    if @discount == nil
        "There is no discount to apply."
    else
        @total = @total - (@total * @discount / 100)   
        "After the discount, the total comes to $#{@total}."
    end
  end 
  def items 
    item_names = []
    @items.each do | item_info |
      #test expects product name * quantity...
      for qty in 1..item_info[:quantity] 
        item_names << item_info[:name]
      end 
    end 
    item_names
  end 
  def void_last_transaction
    self.total -= @total 
  end 
end