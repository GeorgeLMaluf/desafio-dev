require 'rails_helper'

RSpec.describe "Api::V1::Providers", type: :request do
  it "GET /index" do
    headers = { CONTENT_TYPE: 'application/json' }
    get '/api/v1/providers', headers: headers
    expect(response.content_type).to eq('application/json; charset=utf-8')
    expect(response).to have_http_status(:ok)
  end
end
