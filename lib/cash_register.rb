class CashRegister
    attr_writer :total
    attr_reader :discount
    attr_accessor :items

    def initialize(discount=0)
        @total = 0
        @last_total = 0
        @discount = discount
        @items = []
    end

    def total
        @total
    end

    #accepts a title and a price and increases the total
    def add_item(title, price, quant = 1)
        @last_total = @total
        @total += price * quant
        quant.times {@items << title}
    end

    #the cash register was initialized with an employee discount applies the discount to the total price
    def apply_discount
        if discount != 0
        self.total *= (1 - self.discount.to_f/100)
        p "After the discount, the total comes to $#{self.total.to_i}."
        else 
            p "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total = @last_total
        items.pop
    end
end
