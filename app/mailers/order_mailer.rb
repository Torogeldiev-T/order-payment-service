class OrderMailer < ApplicationMailer
  def send_payment_success_email
    @order = params[:order]
    mail(to: @order.client_email, subject: "Order has been successfully processed")
  end

  def send_payment_failure_email
    @order = params[:order]
    mail(to: @order.client_email, subject: "Order payment error")
  end
end
