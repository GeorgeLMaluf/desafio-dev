# frozen_string_literal: true

module Api
  module V1
    class ProviderSerializer < Api::BaseSerializer
      attributes :name_provider,
                 :name_owner
    end
  end
end
