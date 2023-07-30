module Orders
  class ChangeStatusUnit
    def invoke(order_id, status)
      order = Order.find(order_id)
      
      raise StandardError, "Invalid order status: #{status}" unless Order::STATUSES.include?(status)      
      
      order.update(status: status)
      order
    end
  end
end