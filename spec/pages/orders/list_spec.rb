require 'rails_helper'

RSpec.describe Pages::Orders::List do
  describe '#invoke' do
    it "returns order data" do
      order = create(:order)

      expect(described_class.new.invoke).to eq(
        [
          id: order.id,
          client_address: order.address,
          client_email: order.client_email,
          client_fullname: order.client_fullname,
          client_phone_number: order.client_phone_number,
          posted_at: order.posted_at,
          status: order.status,
          total_amount: order.total_amount
        ]
      )
    end
  end
end
