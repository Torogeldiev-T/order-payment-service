require 'httparty'

module SberBank
  module Payments
    module Requests
      class RegisterOrderRq
        include HTTParty
        include Rails.application.routes.url_helpers
        BASE_URL = 'https://securepayments.sberbank.ru/payment/rest' # not real

        def initialize(username: 'username', password: 'password')
          @auth = { username: username, password: password }
        end

        def invoke(order)
          options = {
            body: {
              userName: @auth[:username],
              password: @auth[:password],
              orderNumber: order.id,
              amount: order.total_amount,
              returnUrl: order_path(order.id),
              currency: SberBank::Payments::Enums::Currencies::RUB,
              language: SberBank::Payments::Enums::Languages::RUSSIAN,
              orderBundle:  {
                orderCreationDate: order.posted_at,
                customerDetails: {
                  email: order.client_email,
                  phone: prepare_client_phone_number(order.client_phone_number),
                  fullName: order.client_fullname,
                },
                cartItems: {
                  items: items(order)
                }
              }
            }
          }
          response = self.class.post(BASE_URL, options).body
          parsed_data = JSON.parse(response)
          raise StandardError, "Error during order registration: #{parsed_data['errorMessage']}" if parsed_data['errorCode'].present?

          Orders::ChangeStatusUnit.new.invoke(order.id, Order::STATUS_PROCESSING)
          parsed_data
        end

        private

        def items(order)
          order_lines = order.order_lines
          order_lines.each_with_object([]) do |order_line, memo|
            memo << {
              positionId: order_line.id,
              name: order_line.order_item_name,
              quantity: {
                value: order_line.order_item_units,
                measure: SberBank::Payments::Enums::MEASURE_IN_PIECES
              },
              # id of product, since we do not have this entity we are passing random ID
              itemCode: Random.rand(1000) + 1
            }
          end
        end

        # remove (, ), - chars from phone number
        def prepare_client_phone_number(client_phone_number)
          client_phone_number.gsub(/\s+|\(|\)|\-/, "")
        end
      end
    end
  end
end
