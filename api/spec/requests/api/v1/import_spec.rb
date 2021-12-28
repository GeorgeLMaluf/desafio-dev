require 'rails_helper'

RSpec.describe "Api::V1::Importer", type: :request do
  it "POST import_file" do
    headers = { CONTENT_TYPE: 'application/json' }

    post '/api/v1/import_file',
      params: {
        files: fixture_file_upload('test_cnab.txt')
      },
      headers: headers

    expect(response).to have_http_status(:ok)
    expect(response.body).to eq('Upload and data imported successfully.')
  end
end
