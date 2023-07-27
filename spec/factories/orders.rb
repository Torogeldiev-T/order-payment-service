FactoryBot.define do
  factory :order do
    client_fullname { 'John Doe' }
    client_email  { 'john@gmail.com' }
    client_phone_number { '+7 (517) 333-2061' }
    address  { 'пл. Больничная, 590' }
    status { Order::STATUS_PENDING }
    posted_at { '2023-07-27 15:41:12 UTC' }
  end
end