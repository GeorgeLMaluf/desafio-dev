# frozen_string_literal: true

module Api
  module V1
    class ProviderSerializer < Api::BaseSerializer
      attributes :provider_name,
                 :provider_owner

      def provider_name
        object.provider_name
      end

      def provider_owner
        object.provider_owner
      end
    end
  end
end
