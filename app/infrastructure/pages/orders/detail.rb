module Pages
  module Orders
    class Detail < Base
      def invoke(order_id)
        order = Order.find(order_id)

        order_lines = order.order_lines.each_with_object([]) do |order_line, memo|
          memo << Presenters::OrderLines::Detail.build(
            order_item_name: order_line.order_item_name,
            order_item_price: order_line.order_item_price,
            order_item_units: order_line.order_item_units,
            total_price: order_line.total_price
          )
        end

        order = Presenters::Orders::Detail.build(
          id: order.id,
          client_address: order.address,
          client_email: order.client_email,
          client_fullname: order.client_fullname,
          client_phone_number: order.client_phone_number,
          posted_at: order.posted_at,
          status: order.status,
          total_amount: order.total_amount
        )
        order.merge(order_lines: order_lines)
      end
    end
  end
end