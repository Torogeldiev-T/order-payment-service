desc 'New order with random data'
task create_order: :environment do
  Orders::RandomClientDataOrderUnit.new.invoke
end
