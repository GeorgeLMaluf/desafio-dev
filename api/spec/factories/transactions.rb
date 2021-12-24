# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    transaction_type { 1 }
    value { 242.0 }
    transaction_date { '2021-12-24' }
    hour { '17:08:33' }
    card_number { '7945****1213' }
  end
end
