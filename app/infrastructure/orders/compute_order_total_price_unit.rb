module Orders
  class ComputeOrderTotalPriceUnit
    def invoke(order)
      total_price = order.order_lines.map(&:total_price).sum
      order.update(total_amount: total_price)
    end
  end
end