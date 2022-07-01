class Order
    def initialize(menu)
        @menu = menu
    end

    def formatted_order
       return @menu.selected
    end
    
end