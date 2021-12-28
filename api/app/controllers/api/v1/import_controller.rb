# frozen_string_literal: true

module Api
  module V1
    class ImportController < Api::BaseApiController
      skip_before_action :verify_authenticity_token
      before_action :valid_params
      def import_file

        path = params['files'].path

        return default_error unless path.present?

        if ::Importers::CnabImporter.import path
          render json: 'Upload and data imported successfully', status: :ok
        else
          default_error
        end
      end

      private

      def default_error
        render json: 'Something is wrong!', status: :unprocessable_entity
      end

      def valid_params
        params.permit(:files)
      end
    end
  end
end
