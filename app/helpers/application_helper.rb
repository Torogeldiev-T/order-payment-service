module ApplicationHelper
  def order_status_badge(status)
    out = nil
    case status
    when Order::STATUS_PAID
      out = "<div class='inline px-3 py-1 text-sm font-normal rounded-full text-emerald-500 gap-x-2'>
        #{status}
      </div>"
    when Order::STATUS_PENDING
      out = "<div class='inline px-3 py-1 text-sm font-normal rounded-full text-purple-500 gap-x-2'>
        #{status}
      </div>"
    when Order::STATUS_PROCESSING
      out = "<div class='inline px-3 py-1 text-sm font-normal rounded-full text-blue-500 gap-x-2'>
        #{status}
      </div>"
    when Order::STATUS_PROCESSED_WITH_ERROR
      out = "<div class='inline px-3 py-1 text-sm font-normal rounded-full text-red-500 gap-x-2'>
        #{status}
      </div>"
    end
 
    render(inline: out)
  end
end
