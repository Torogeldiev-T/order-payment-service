require 'rails_helper'

RSpec.describe Services::OrderLines::Create do
  describe 'sucsess' do
    it 'creates order' do
      order = create(:order)
      order_line = described_class.new.invoke(
        order: order, order_item_name: 'apple', order_item_price: 1.2, order_item_units: 5
      )
      expect(order_line.order_item_name).to eq('apple')
      expect(order_line.order_item_price).to eq(1.2)
      expect(order_line.order_item_units).to eq(5)
      expect(order_line.total_price).to eq(6)
    end
  end
end