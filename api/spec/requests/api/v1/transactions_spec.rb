require 'rails_helper'

RSpec.describe 'Api::V1::Transactions', type: :request do
  describe 'GET /index' do
    headers = { CONTENT_TYPE: 'application/json' }
    get '/api/v1/transactions', headers: headers
    expect(response.content_type).to eq('application/json; charset=utf-8')
    expect(response).to have_http_status(:ok)
  end
end
