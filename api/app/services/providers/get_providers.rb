# frozen_string_literal: true

module Providers
  class GetProviders
    def call
      response = []

      providers = Provider.all.order(:name_provider)

      providers.each do |provider|
        response.push(::Api::V1::ProviderSerializer.new(provider))
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