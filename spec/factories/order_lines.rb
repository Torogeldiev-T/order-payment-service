FactoryBot.define do
  factory :order_line do
    order_item_name { 'Apple' }
    order_item_price { 0.15 }
    order_item_units { 3 }
    total_price { 0.45 }
    order
  end
end