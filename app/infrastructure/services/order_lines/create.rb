module Services
  module OrderLines
    class Create
      def initialize
        @create_query = ::Queries::OrderLines::Create.new
        @logger = Rails.logger
      end

      def invoke(order:, order_item_name:, order_item_price:, order_item_units:)
        total_price = order_item_price * order_item_units
        order_line = @create_query.invoke(
          order: order, 
          order_item_name: order_item_name,
          order_item_price: order_item_price,
          order_item_units: order_item_units,
          total_price: total_price
        )
        if order_line.valid?
          @logger.info("Created order line with data #{order_line.attributes}")
        else
          @logger.error(order_line.errors.join("\n"))
          return nil
        end

        order_line
      end
    end
  end
end
