class Order
    def initialize(menu)
        @menu = menu
    end

    def formatted_order
       return @menu.selected
    end

    def receipt
       return "#{@menu.selected}TOTAL: £#{@menu.receipt_total.to_s}"
    end
end