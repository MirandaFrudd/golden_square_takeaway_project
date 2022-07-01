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
    end
end

