require 'order'

RSpec.describe Order do
    context "As a customer" do
        it "returns formatted order" do
            menu = double(:menu, selected: "Salad - £9\nPizza - £12\nPizza - £12\n")
            order = Order.new(menu)
            expect(order.formatted_order).to eq "Salad - £9\nPizza - £12\nPizza - £12\n"
        end

        it 'returns the receipt' do
            menu = double(:menu, selected: "Salad - £9\nPizza - £12\nPizza - £12\n", receipt_total: 33)
            order = Order.new(menu)      
            expect(order.receipt).to eq  "Salad - £9\nPizza - £12\nPizza - £12\nTOTAL: £33"
        end
    end
end
