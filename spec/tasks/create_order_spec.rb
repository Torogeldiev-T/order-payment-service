require 'rails_helper'
Rails.application.load_tasks

describe 'create_order.rake' do
  it 'creates new order with one order line' do
    Rake::Task['create_order'].invoke
    expect(Order.count).to eq(1)
    expect(OrderLine.count).to eq(1)

    order = Order.last
    order_line = OrderLine.last
    expect(order.total_amount).to eq(order_line.total_price)
    expect(order_line.total_price).to eq(order_line.order_item_units * order_line.order_item_price)
  end
end
