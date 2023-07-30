module Orders
  class RandomClientDataOrderUnit
    def initialize
      @order_service = ::Services::Orders::Create.new
      @order_line_service = ::Services::OrderLines::Create.new
      @order_total_price_unit = ::Orders::ComputeOrderTotalPriceUnit.new
    end

    def invoke
      order_params = generate_order_params
      order = @order_service.invoke(**order_params)
      return if order.blank?
        
      @order_line_service.invoke(order: order, **generate_order_line_params)
      @order_total_price_unit.invoke(order)
    end

    def generate_order_params
      client_fullname = Faker::Name.name
      Faker::Config.locale = :ru
      {
        client_fullname: client_fullname,
        client_email: client_fullname.split(' ').first.downcase + "@gmail.com",
        client_phone_number: Faker::PhoneNumber.phone_number_with_country_code, # +7 (929)114-53-31 in this format
        client_address: Faker::Address.street_address
      }
    end

    def generate_order_line_params
      {
        order_item_name: Faker::Commerce.product_name,
        order_item_price: Faker::Commerce.price,
        order_item_units: Random.rand(5) + 1
      }
    end
  end
end