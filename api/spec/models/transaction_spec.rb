# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Transaction, type: :model do
  let!(:customer) { create(:customer) }
  let!(:provider) { create(:provider) }

  context 'when create a valid transaction and' do
    subject(:transaction) {
      build(:transaction,
            provider_id: provider.id,
            customer_id: customer.id,
            transaction_type: 1,
            value: 101.10,
            transaction_date: '2121-12-24',
            hour: '18:00:01',
            card_number: '7945****1213')
    }

    describe 'validation' do
      it { should be_valid }
      it { should belong_to(:provider) }
      it { should belong_to(:customer) }
      it { expect(transaction.transaction_type).to eq('debito') }
      it { expect(transaction.value).to eq(101.10) }
      it { expect(transaction.transaction_date.class).to eq(Date) }
      it { expect(transaction.hour).to eq('18:00:01') }
      it { expect(transaction.card_number).to eq('7945****1213') }
    end

    describe 'before save actions' do 
      it {
        transaction.save!
        expect(transaction.nature).to eq('Entrada')
      }
      it {
        transaction.save!
        expect(transaction.signal).to eq(true)
      }
    end
  end

  context 'when create a transaction without provider and' do
    subject(:transaction) {
      build(:transaction,
            provider: nil,
            customer_id: customer.id,
            transaction_type: 1,
            value: 101.10,
            transaction_date: '2121-12-24',
            hour: '18:00:01',
            card_number: '7945****1213')
    }

    it 'fails' do
      should be_invalid
    end
  end

  context 'when create a transaction without customer and' do
    subject(:transaction) {
      build(:transaction,
            provider_id: provider.id,
            customer: nil,
            transaction_type: 1,
            value: 101.10,
            transaction_date: '2121-12-24',
            hour: '18:00:01',
            card_number: '7945****1213')
    }

    it 'fails' do
      should be_invalid
    end
  end
end
