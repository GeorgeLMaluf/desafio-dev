# frozen_string_literal: true

module Api
  module V1
    class TransactionsController < Api::BaseApiController
      before_action :valid_params, only: [:by_provider]

      def index
        response = ::Transactions::GetTransactions.call
        render json: response.to_json, status: :ok
      end

      def by_provider
        response = ::Transactions::GetTransactionsByProvider.call params['providerId']
        render json: response.to_json, status: :ok
      end

      private

      def valid_params
        params.permit(:providerId)
      end
    end
  end
end
