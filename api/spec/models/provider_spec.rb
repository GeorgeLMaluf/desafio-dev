# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Provider, type: :model do

  context 'when create a new Provider with valid provider name' do
    subject(:provider) { build :provider }

    describe 'validation' do
      it { should be_valid }
    end
  end

  context 'when try create a Provider but it already exists and' do
    let(:name) { Faker::Name.first_name }
    subject(:provider) { create :provider, name_provider: name }
    subject(:provider2) { build :provider, name_provider: name }

    it 'fails' do  
      expect(provider).to be_valid
      expect(provider2.save).to eq(false)
      expect { provider2.save! }.to raise_error
    end
  end
end
