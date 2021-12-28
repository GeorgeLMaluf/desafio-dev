# frozen_string_literal: true

module Transactions
  class GetTransactionsByProvider
    def call(provider_id)
      response = {}
      items = []

      provider = Provider.find_by(id: provider_id)
      return response unless provider.present?

      transactions = Transaction.where(provider: provider).order(:transaction_date, :hour)

      balance  = transactions.sum{ |t| t.value * (t.signal? ? 1 : -1 )}

      transactions.each do |t|
        items.push({
          id: t.id,
          customer_cpf: t.customer.cpf,
          card: t.card_number,
          type: t.transaction_type,
          nature: t.nature,
          signalized_value: t.value * (t.signal? ? 1 : -1)
        })
      end

      response = { 
        provider_name: provider.name_provider.split(' ')&.map { |x| x.capitalize }.join(' '),
        balance: balance,
        transactions: items
      }

    end

    class << self
      def call(provider_id)
        new.call(provider_id)
      end
    end
  end
end
