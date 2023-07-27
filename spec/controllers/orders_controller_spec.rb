require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  
  
  describe '#index' do
    it 'returns orders' do
      order_1 = create(:order)
      order_2 = create(:order, client_fullname: 'Soul Goodman') 
      
      get :index

      expect(response.status).to eq(200)
      expect(assigns(:orders)).to eq(
        [
          {
            id: order_1.id,
            client_address: order_1.address,
            client_email: order_1.client_email,
            client_fullname: order_1.client_fullname,
            client_phone_number: order_1.client_phone_number,
            posted_at: order_1.posted_at,
            status: order_1.status,
            total_amount: order_1.total_amount
          },
          {
            id: order_2.id,
            client_address: order_2.address,
            client_email: order_2.client_email,
            client_fullname: order_2.client_fullname,
            client_phone_number: order_2.client_phone_number,
            posted_at: order_2.posted_at,
            status: order_2.status,
            total_amount: order_2.total_amount
          }
        ]
      ) 
    end
  end

  describe '#show' do
    it 'returns orders' do
      Rails.application.load_tasks
      Rake::Task['create_order'].invoke  

      order = Order.last
      order_line = OrderLine.last

      get :show, params: { id: order.id }

      expect(response.status).to eq(200)
      expect(assigns(:order)).to eq(
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
        },
      )
    end
    
    context 'invalid order_id' do
      it 'raises error' do
        expect {
          get :show, params: { id: 'INVALID' }
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe '#process_payment_request' do
    it 'success' do
    end
  end
end