require 'rails_helper'

RSpec.describe 'Api::V1::Transactions', type: :request do
  it 'GET /index' do
    headers = { CONTENT_TYPE: 'application/json' }
    get '/api/v1/transactions', headers: headers
    expect(response.content_type).to eq('application/json; charset=utf-8')
    expect(response).to have_http_status(:ok)
  end

  it 'GET /by_provider/:providerId' do
    headers = { CONTENT_TYPE: 'application/json' }
    providerId = 1
    get "/api/v1/transactions/by_provider/#{providerId}", headers: headers
    expect(response.content_type).to eq('application/json; charset=utf-8')
    expect(response).to have_http_status(:ok)
  end
end
