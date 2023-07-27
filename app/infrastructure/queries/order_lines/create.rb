module Queries
  module OrderLines
    class Create
      def invoke(order:, order_item_name:, order_item_price:, order_item_units:, total_price:)
        order = OrderLine.create(
          order: order, 
          order_item_name: order_item_name,
          order_item_price: order_item_price,
          order_item_units: order_item_units,
          total_price: total_price
        )
      end
    end
  end
end