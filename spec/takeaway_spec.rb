require 'takeaway'

RSpec.describe Takeaway do
    context 'as a customer' do
        it 'returns the full menu with dishes and price' do
            menu = double(:menu, formatted_menu: "Salad - £9\nBurger - £12\nPasta - £11\nPizza - £12\n")
            order = double :order
            takeaway = Takeaway.new(menu, order)
            expect(takeaway.full_menu).to eq  "Salad - £9\nBurger - £12\nPasta - £11\nPizza - £12\n"
        end

        it "returns formatted order" do
            order = double(:order, formatted_order: "Salad - £9\nPizza - £12\nPizza - £12\n")
            menu = double :menu
            takeaway = Takeaway.new(menu, order)
            expect(takeaway.formatted_order).to eq "Salad - £9\nPizza - £12\nPizza - £12\n"
        end

        it "returns formatted receipt" do
            order = double(:order, receipt: "Salad - £9\nPizza - £12\nPizza - £12\nTOTAL: £33")
            menu = double :menu
            takeaway = Takeaway.new(menu, order)
            expect(takeaway.receipt).to eq "Salad - £9\nPizza - £12\nPizza - £12\nTOTAL: £33"
        end
    end
end
