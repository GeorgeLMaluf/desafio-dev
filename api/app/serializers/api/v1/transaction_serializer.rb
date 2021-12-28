# frozen_string_literal: true

module Api
  module V1
    class TransactionSerializer < Api::BaseSerializer
      attributes :id,
                 :provider_name,
                 :customer_cpf,
                 :card,
                 :type,
                 :nature,
                 :signalized_value

      def provider_name
        object.provider.name_provider.split(' ')&.map { |x| x.capitalize }.join(' ')
      end

      def customer_cpf
        object.customer.cpf
      end

      def card
        object.card_number
      end

      def type
        object.transaction_type
      end

      def nature
        object.nature
      end

      def signalized_value
        object.value * (object.signal? ? 1 : -1)
      end
    end
  end
end
