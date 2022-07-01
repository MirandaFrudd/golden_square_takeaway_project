require 'menu'

RSpec.describe Menu do
    context 'as a customer' do
        it 'return a formatted menu' do
            menu = Menu.new({"salad" => {"price" => 9, "number selected" => 0}, "burger" => {"price" => 12, "number selected" => 0}, "pasta" => {"price" => 11, "number selected" => 0}, "pizza" => {"price" => 12, "number selected" => 0}})
            expect(menu.formatted_menu).to eq "Salad - £9\nBurger - £12\nPasta - £11\nPizza - £12\n"
        end

        it "selects the chosen menu items" do
            menu = Menu.new({"salad" => {"price" => 9, "number selected" => 0}, "burger" => {"price" => 12, "number selected" => 0}, "pasta" => {"price" => 11, "number selected" => 0}, "pizza" => {"price" => 12, "number selected" => 0}})
            menu.select("pizza")
            menu.select("salad")
            menu.select("pizza")
            expect(menu.selected).to eq "Salad - £9\nPizza - £12\nPizza - £12\n"
        end
    end
end