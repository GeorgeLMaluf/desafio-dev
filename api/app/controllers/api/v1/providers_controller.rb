# frozen_string_literal: true

module Api
  module V1
    class ProvidersController < Api::BaseApiController
      def index
        response = ::Providers::GetProviders.call
        render json: response.to_json, status: :ok
      end
    end
  end
end
