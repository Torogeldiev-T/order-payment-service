require 'rails_helper'

RSpec.describe Orders::ChangeStatusUnit do
  let(:order) { create(:order) }

  it "changes status" do
    expect(described_class.new.invoke(order.id, Order::STATUS_PAID)).to be_valid
  end

  it "raises error with invalid status" do
    expect { described_class.new.invoke(order.id, 'invalid status') }.to raise_error(StandardError, 'Invalid order status: invalid status')
  end
end
