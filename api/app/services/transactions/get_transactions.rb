# frozen_string_literal: true

module Transactions
  class GetTransactions
    def call
      response = []

      transactions = Transaction.all.order(:transaction_date, :hour)

      transactions.each do |transaction|
        response.push(::Api::V1::TransactionSerializer.new(transaction))
      end

      response
    end

    class << self
      def call
        new.call
      end
    end
  end
end
