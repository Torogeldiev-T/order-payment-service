require 'httparty'

module SberBank
  module Payments
    module Enums
      MEASURE_IN_PIECES = 0
      
      module Currencies
        RUB = 'RUB'
      end

      module Languages
        RUSSIAN = 'ru'
      end

      module Statuses
        SUCCESS = 1
        FAILURE = 0
      end
    end
  end
end
