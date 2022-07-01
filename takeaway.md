# PROBLEM

1. As a customer -> Read a menu with dishes and prices
So that I can check if I want to order something
I would like to see a list of dishes with prices.

2. As a customer -> Add/select one or more dishes to my cart
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

3. As a customer -> Read what is in my cart. 
As a customer -> Read a receipt with the full list of items and total amount.
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

# Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

4. As a customer -> Send a text confirming the order and using Time to set a delivery time
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

# CLASS INTERFACE
Menu -> lots of dependents - price, item

Order -> print/read
-> total

Takeaway -> coordinates everything

class Menu
    def initialize  DONE
        # hash => item, price, num_selected
    end

    def formatted_menu DONE
        # menu items and price
    end

    def select(dish) DONE
        # select the item
        # adds 1 to num_selected
        # returns nothing
    end

    def selected DONE
        # returns the selected items - dupes if selected multiple times
    end

end

class Takeaway
    def initialize
        # @order; @menu -> instance of menu hash
    end

    def full_menu DONE
        # returns the full menu
    end

    def view_order
        # returns the full order
    end

    def receipt
        # returns the totalled formatted order
    end

end

class Order
    def initialize
        #menu instance; order instance (array?)
    end

    def formatted_order
        # filters only the selected items and their amounts -> adds them to order
        # returns formatted order
    end

    def total
        # totals up all the order amounts 
        # returns nothing
    end
end

# EXAMPLE TESTS

# Takeaway integration

# 1 - As a customer, return the full menu with dishes and price - DONE

takeaway = Takeaway.new(order, menu)

menu = Menu.new({"salad" => {"price" => 9, "number selected" => 0}, "burger" => {"price" => 12, "number selected" => 0}, "pasta" => {"price" => 11, "number selected" => 0}, "pizza" => {"price" => 12, "number selected" => 0}})

takeaway.full_menu # => "Salad - £9\nBurger - £12\nPasta - £11\nPizza - £12\n"

# 2 - As a customer, return my full order DONE
takeaway = Takeaway.new(order, menu)

menu = Menu.new({"salad" => {"price" => 9, "number selected" => 0}, "burger" => {"price" => 12, "number selected" => 0}, "pasta" => {"price" => 11, "number selected" => 0}, "pizza" => {"price" => 12, "number selected" => 0}})

menu.add_to_order("pasta")
menu.add_to_order("pizza")
menu.add_to_order("pizza")

order = Order.new(menu)
order.full_order

takeaway.view_order # =>  "Pasta - £11\nPizza - £12\nPizza - £12\n"

# 3 - As a customer, return my receipt
takeaway = Takeaway.new(order, menu)

menu = Menu.new({"salad" => {"price" => 9, "number selected" => 0}, "burger" => {"price" => 12, "number selected" => 0}, "pasta" => {"price" => 11, "number selected" => 0}, "pizza" => {"price" => 12, "number selected" => 0}})

menu.add_to_order("pasta")
menu.add_to_order("pizza")
menu.add_to_order("pizza")

order = Order.new(menu)
order.full_order
order.total

takeaway.receipt => takeaway.full_order # => "Pasta - £11\nPizza - £12\nPizza - £12\nTOTAL = £35"

# Takeaway Unit Testing

# 1 - As a customer, return the full menu with dishes and price DONE
takeaway = Takeaway.new(order, menu)

menu = double (:menu, initialize: {"salad" => {"price" => 9, "number selected" => 0})

expect(takeaway.full_menu).to eq "Salad - £9\n"

# 2 - As a customer, return my full order DONE
takeaway = Takeaway.new(order, menu)

menu = double (:menu, initialize: {"salad" => {"price" => 9, "number selected" => 0})

menu.add_to_order("salad")
menu.add_to_order("salad")

order = double (:order, full_order: [{"salad" => {"price" => 9, "number selected" => 2}}])

expect(takaway.view_order).to eq("Salad - £9\nSalad - £9")

# 3 - As a customer, return my receipt
takeaway = Takeaway.new(order, menu)

menu = double (:menu, initialize: {"salad" => {"price" => 9, "number selected" => 0})

menu.add_to_order("salad")
menu.add_to_order("salad")

order = double :order
allow(order).to_receive(:full_order).with([{"salad" => {"price" => 9, "number selected" => 2}}])
order.total

order = double (:order, full_order: [{"salad" => {"price" => 9, "number selected" => 2}}], total: 18)

takeaway.receipt # => "Salad - £9\nSalad - £9\nTOTAL = £18"

# Menu unit tests

# 1 - returns a formatted menu

menu = Menu.new({"salad" => {"price" => 9, "number selected" => 0}, "burger" => {"price" => 12, "number selected" => 0}, "pasta" => {"price" => 11, "number selected" => 0}, "pizza" => {"price" => 12, "number selected" => 0}})

expect(menu.formatted_menu).to eq "Salad - £9\nBurger - £12\nPasta - £11\nPizza - £12"