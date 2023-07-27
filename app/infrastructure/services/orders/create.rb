module Services
  module Orders
    class Create
      def initialize
        @create_query = ::Queries::Orders::Create.new
        @logger = Rails.logger
      end

      def invoke(client_fullname:, client_phone_number:, client_email:, client_address:)
        order = @create_query.invoke(
          client_fullname: client_fullname, 
          client_phone_number: client_phone_number,
          client_email: client_email, 
          client_address: client_address
        )
        if order.valid?
          @logger.info("Created order with data #{order.attributes}")
        else
          @logger.error(order.errors.join("\n"))
          return nil
        end

        order
      end
    end
  end
end
