module Presenters
  module OrderLines
    class Detail
      def self.build(order_item_name:, order_item_price:, order_item_units:, total_price:)
        {
          order_item_name: order_item_name,
          order_item_price: order_item_price,
          order_item_units: order_item_units,
          total_price: total_price
        }
      end
    end
  end
end
