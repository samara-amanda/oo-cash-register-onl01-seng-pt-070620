class CashRegister

  attr_reader :discount, :items
  attr_accessor :total

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item_name, price, quantity = 1)
    @total = @total + (price * quantity)
    quantity.times do
      @items << item_name
      @last_item_price = price
    end
  end

  def apply_discount
    @total = @total - (@discount.to_f/100 * @total)

    if @discount == 0
      "There is no discount to apply."
    else
      "After the discount, the total comes to $#{total.to_i}."
    end
  end

  def void_last_transaction
      @total = @total - (@last_item_price)
      @items.pop
      if @items.length == 0
        @total == 0.0
      end
    end

  end
