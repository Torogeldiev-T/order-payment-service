class OrdersController < ApplicationController
  def index
    @orders = Pages::Orders::List.new.invoke
  end

  def show
    @order = Pages::Orders::Detail.new.invoke(params[:id])
  end

  def payment_process_request
    register_order_rq = SberBank::Payments::Requests::RegisterOrderRq.new
    order = Order.find(params[:id])
    response = register_order_rq.invoke(order)
    redirect_to response['formUrl'], allow_other_host: true and return
  rescue StandardError => e
    flash[:error] = e.message
    redirect_to root_path
  end

  def payment_process_callback
    if params['status'].to_i == SberBank::Payments::Enums::Statuses::SUCCESS
      order = Orders::ChangeStatusUnit.new.invoke(params['orderNumber'], Order::STATUS_PAID)
      Services::Clients::NotificationService.send_payment_success_email(order)
    else
      order = Orders::ChangeStatusUnit.new.invoke(params['orderNumber'], Order::STATUS_PROCESSED_WITH_ERROR)
      Services::Clients::NotificationService.send_payment_failure_email(order)
    end

    head :ok
  end

  def create
    Rails.application.load_tasks
    Rake::Task['create_order'].invoke
  rescue StandartError => e
    flash[:error] = e.message
  ensure
    redirect_to root_path
  end
end