# frozen_string_literal: true

module Api
  module V1
    class ProviderSerializer < Api::BaseSerializer
      attributes :name_provider,
                 :name_owner

      def name_provider
        object.name_provider.split(' ')&.map { |x| x.capitalize }.join(' ')
      end

      def name_owner
        object.name_owner.split(' ')&.map { |x| x.capitalize }.join(' ')
      end
    end
  end
end
