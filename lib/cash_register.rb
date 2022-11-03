require "pry"

class CashRegister
    attr_accessor :discount, :title, :price, :total, :quantity, :items, :prices
   
    def initialize(discount=0)
        @discount = discount
        @title = title
        @price = price
        @total = 0
        @items = []
        @prices = []
    end
    def add_item(title, price, quantity=1)
        @quantity = quantity
        @title = title
        @price = price
        self.total += price * quantity
        quantity.times { self.items << title }
        quantity.times { self.prices << price}
    end
    def apply_discount
        if discount > 0
            self.total = (1 - self.discount.to_f/100) * total
            "After the discount, the total comes to $#{self.total.round}."
        else
            "There is no discount to apply."
        end
    end
    def void_last_transaction
        self.quantity.times do 
            self.total -= prices[-1]
            self.prices.pop
            self.items.pop
            if self.items == []
                self.total = 0.0
            end
        end
    end

end