class Menu
    def initialize(menu)
        @menu = menu
    end

    def formatted_menu
        display_menu = ""
        @menu.each do | dish, hash |
            hash.each do | key, value |
                if key == 'price'
                    display_menu += "#{dish.capitalize} - £#{value.to_s}\n"
                end
            end
        end
        return display_menu
    end

    def select(dish)  
        @menu.select do | key, value | 
            if key == dish 
                value["number selected"] += 1
            end
        end
    end

    def selected
        selected_formatted = ""
        @menu.each do | dish, hash |
            if hash["number selected"] > 0
                selected_formatted += "#{dish.capitalize} - £#{hash['price'].to_s}\n" * hash["number selected"]
            end
        end
        return selected_formatted
    end
end

