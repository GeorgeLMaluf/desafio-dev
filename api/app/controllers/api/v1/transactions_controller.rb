# frozen_string_literal: true

module Api
  module V1
    class TransactionsController < Api::BaseApiController
      def index
        response = ::Transactions::GetTransactions.call
        render json: response.to_json, status: :ok
      end
    end
  end
end
