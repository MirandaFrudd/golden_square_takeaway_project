require 'order'

RSpec.describe Order do
    context "As a customer" do
        it "returns formatted order" do
            menu = Menu.new({"salad" => {"price" => 9, "number selected" => 1}, "burger" => {"price" => 12, "number selected" => 2}, "pasta" => {"price" => 11, "number selected" => 0}, "pizza" => {"price" => 12, "number selected" => 0}})
            order = Order.new(menu)
            expect(order.formatted_order).to eq "Salad - £9\nBurger - £12\nBurger - £12\n"
        end
    end
end