require 'rails_helper'

RSpec.describe Services::Orders::Create do
  describe 'sucsess' do
    it 'creates order' do
      order = described_class.new.invoke(
        client_fullname: 'John Doe',
        client_phone_number: '132-321-321',
        client_email: 'john@gmail.com',
        client_address: 'White st, 344'
      )

      expect(order.client_fullname).to eq('John Doe')
      expect(order.client_phone_number).to eq('132-321-321')
      expect(order.client_email).to eq('john@gmail.com')
      expect(order.address).to eq('White st, 344')
      expect(order.status).to eq(Order::STATUS_PENDING)
    end
  end
end