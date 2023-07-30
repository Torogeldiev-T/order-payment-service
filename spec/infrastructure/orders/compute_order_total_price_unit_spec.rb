require 'rails_helper'

RSpec.describe Orders::ComputeOrderTotalPriceUnit do
  it "computes total price" do
    order = create(:order)
    order_line = create(:order_line, order_id: order.id)

    described_class.new.invoke(order)
    
    order.reload
    expect(order.total_amount).to eq(order_line.total_price)
  end
end
