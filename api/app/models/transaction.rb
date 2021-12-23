# frozen_string_literal: true

class Transaction < ApplicationRecord
  before_save :set_transaction_nature_and_signal

  TRANSACTION_TYPES_DEBTS_SOURCES = %w[boleto financiamento aluguel].freeze

  validates :transaction_type, presence: true
  belongs_to :customer
  belongs_to :provider

  enum transaction_type: {
    debito: 1,
    boleto: 2,
    financiamento: 3,
    credito: 4,
    recebimento: 5,
    vendas: 6,
    recebimento_ted: 7,
    recebimento_doc: 8,
    aluguel: 9
  }

  def set_transaction_nature_and_signal
    signal = !TRANSACTION_TYPES_DEBTS_SOURCES.include?(self.transaction_type)
    nature = signal ? 'Entrada' : 'Saída'
    self.signal = signal
    self.nature = nature
  end
end
