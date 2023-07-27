module Queries
  module Orders
    class Create
      def invoke(client_fullname:, client_phone_number:, client_email:, client_address:)
        order = Order.create(
          client_fullname: client_fullname,
          client_phone_number: client_phone_number,
          client_email: client_email,
          address: client_address,
          status: Order::STATUS_PENDING,
          posted_at: Time.zone.now
        )
      end
    end
  end
end