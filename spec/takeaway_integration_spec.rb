require 'takeaway'
require 'order'
require 'menu'

RSpec.describe Takeaway do
    context 'as a customer' do
        it 'returns the full menu with dishes and price' do
            menu = Menu.new({"salad" => {"price" => 9, "number selected" => 0}, "burger" => {"price" => 12, "number selected" => 0}, "pasta" => {"price" => 11, "number selected" => 0}, "pizza" => {"price" => 12, "number selected" => 0}})
            order = Order.new(menu)
            takeaway = Takeaway.new(menu, order)
            expect(takeaway.full_menu).to eq  "Salad - £9\nBurger - £12\nPasta - £11\nPizza - £12\n"
        end

        it 'returns the full order, formatted nicely' do
            menu = Menu.new({"salad" => {"price" => 9, "number selected" => 0}, "burger" => {"price" => 12, "number selected" => 0}, "pasta" => {"price" => 11, "number selected" => 0}, "pizza" => {"price" => 12, "number selected" => 0}})
            order = Order.new(menu)
            menu.select("pizza")
            menu.select("salad")
            menu.select("pizza")
            menu.select("pasta")
            takeaway = Takeaway.new(menu, order)            
            expect(takeaway.formatted_order).to eq  "Salad - £9\nPasta - £11\nPizza - £12\nPizza - £12\n"
        end

        it 'returns the receipt' do
            menu = Menu.new({"salad" => {"price" => 9, "number selected" => 0}, "burger" => {"price" => 12, "number selected" => 0}, "pasta" => {"price" => 11, "number selected" => 0}, "pizza" => {"price" => 12, "number selected" => 0}})
            order = Order.new(menu)
            menu.select("pizza")
            menu.select("salad")
            menu.select("pizza")
            menu.select("pasta")
            takeaway = Takeaway.new(menu, order)            
            expect(takeaway.receipt).to eq  "Salad - £9\nPasta - £11\nPizza - £12\nPizza - £12\nTOTAL: £44"
        end
    end
end

RSpec.describe Order do
    context "As a customer" do
        it "returns formatted order" do
            menu = Menu.new({"salad" => {"price" => 9, "number selected" => 1}, "burger" => {"price" => 12, "number selected" => 2}, "pasta" => {"price" => 11, "number selected" => 0}, "pizza" => {"price" => 12, "number selected" => 0}})
            order = Order.new(menu)
            expect(order.formatted_order).to eq "Salad - £9\nBurger - £12\nBurger - £12\n"
        end
    end
end

