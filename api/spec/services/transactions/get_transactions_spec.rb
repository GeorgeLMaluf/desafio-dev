require 'rails_helper'

RSpec.describe Transactions::GetTransactions do
  let!(:customer) { create(:customer) }
  let!(:provider) { create(:provider) }

  let!(:item1) { create(:transaction, 
    provider_id: provider.id, 
    customer_id: customer.id) }
  let!(:item2) { create(:transaction, 
    provider_id: provider.id, 
    customer_id: customer.id) }
  let!(:item3) { create(:transaction, 
    provider_id: provider.id, 
    customer_id: customer.id) }

  subject(:service) { described_class }

  context 'when there are transactions' do
    it 'return all transactions' do
      transactions = service.call
      
      expect(transactions.count).to eq 3
    end
  end

  context 'when there are not transactions' do
    before do
      DatabaseCleaner.clean
    end

    it 'return zero transactions' do
      transactions = service.call

      expect(transactions.count).to eq 0
    end
  end
end
