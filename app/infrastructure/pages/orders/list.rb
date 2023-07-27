module Pages
  module Orders
    class List < Base
      def invoke
        # may be moved to queries
        orders_query = Order.all

        orders = orders_query.each_with_object([]) do |order, memo|
          memo << Presenters::Orders::Detail.build(
            id: order.id,
            client_address: order.address,
            client_email: order.client_email,
            client_fullname: order.client_fullname,
            client_phone_number: order.client_phone_number,
            posted_at: order.posted_at,
            status: order.status,
            total_amount: order.total_amount
          )
        end
      end
    end
  end
end