require 'rails_helper'

RSpec.describe Pages::Orders::Detail do
  describe '#invoke' do
    before do
      Order.destroy_all
    end

    it "returns order data" do
      order = create(:order)
      order_line = create(:order_line, order: order)

      expect(described_class.new.invoke(order.id)).to eq(
        {
          id: order.id,
          client_address: order.address,
          client_email: order.client_email,
          client_fullname: order.client_fullname,
          client_phone_number: order.client_phone_number,
          posted_at: order.posted_at,
          status: order.status,
          total_amount: order.total_amount,
          order_lines: [
            {
              order_item_name: order_line.order_item_name,
              order_item_price: order_line.order_item_price,
              order_item_units: order_line.order_item_units,
              total_price: order_line.total_price
            }
          ]
        }
      )
    end
  end
end
