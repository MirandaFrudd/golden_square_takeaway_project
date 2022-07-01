require 'takeaway'

RSpec.describe Takeaway do
    context 'as a customer' do
        it 'returns the full menu with dishes and price' do
            menu = double(:menu, formatted_menu: "Salad - £9\nBurger - £12\nPasta - £11\nPizza - £12\n")
            order = double :order
            takeaway = Takeaway.new(menu, order)
            expect(takeaway.full_menu).to eq  "Salad - £9\nBurger - £12\nPasta - £11\nPizza - £12\n"
        end
    end
end
