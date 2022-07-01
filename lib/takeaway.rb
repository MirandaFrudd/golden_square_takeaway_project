class Takeaway
    def initialize(menu, order)
        @menu = menu
        @order = order
    end

    def full_menu
        return @menu.formatted_menu
    end

    def formatted_order
        return @order.formatted_order
    end

    def receipt
        return @order.receipt
    end
end