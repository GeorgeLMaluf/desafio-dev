require 'rails_helper'

RSpec.describe Importers::CnabImporter do
  subject (:service) { described_class }

  let(:upload_file) { fixture_file_upload('test_cnab.txt') }

  context 'when called to process a text file' do

    describe 'test import data' do
      it 'returns true' do
        response = service.import? upload_file.path
        expect(response).to eq(true)
      end
    end
  end
end
