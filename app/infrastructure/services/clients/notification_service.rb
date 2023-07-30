module Services
  module Clients
    class NotificationService
      def self.send_payment_success_email(order)
        OrderMailer.with(order: order).send_payment_success_email.deliver_now
      end

      def self.send_payment_failure_email(order)
        OrderMailer.with(order: order).send_payment_failure_email.deliver_now
      end
    end
  end
end