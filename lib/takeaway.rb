class Takeaway
    def initialize(menu, order)
        @menu = menu
        @order = []
    end

    def full_menu
        return @menu.formatted_menu
    end
end