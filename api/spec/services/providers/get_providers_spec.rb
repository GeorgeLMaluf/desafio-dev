require 'rails_helper'

RSpec.describe Providers::GetProviders do
  subject (:service) { described_class }

  context 'when there are providers' do
    before do
      create_list(:provider, 3)
    end

    it 'return all providers' do
      providers = service.call

      expect(providers.count).to eq 3
    end
  end

  context 'when there are not providers' do
    it 'return zero providers' do
      providers = service.call

      expect(providers.count).to eq 0
    end
  end
end
