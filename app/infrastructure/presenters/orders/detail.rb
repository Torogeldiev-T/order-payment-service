module Presenters
  module Orders
    class Detail
      def self.build(id:, client_address:, client_email:, client_fullname:, client_phone_number:, posted_at:, status:, total_amount:)
        {
          id: id,
          client_address: client_address,
          client_email: client_email,
          client_fullname: client_fullname,
          client_phone_number: client_phone_number,
          posted_at: posted_at,
          status: status,
          total_amount: total_amount
        }
      end
    end
  end
end
