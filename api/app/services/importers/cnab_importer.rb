# frozen_string_literal: true

module Importers
  class CnabImporter
    attr_reader :file_path

    def initialize(file_path)
      @file_path = file_path
    end

    def read_and_import_data
      response = []

      return response unless valid_extension?(@file_path)

      readed_file = File.open(@file_path).readlines

      readed_file.each do |line|
        data = line_to_hash(line)
        customer = find_or_create_customer(data['customer'])
        provider = find_or_create_provider(data['provider'])
        data_transaction = data['transaction'].merge(
          { customer_id: customer.reload.id, provider_id: provider.reload.id }
        )

        Transaction.create(data_transaction)
      end

      response
    end

    class << self
      def import(file_path)
        new(file_path).read_and_import_data
      end
    end

    private

    def valid_extension?(file)
      File.extname(file).match?(/txt|csv/)
    end

    def line_to_hash(line)
      type = line[0, 1].strip
      date = Date.parse(line[1, 8].strip).strftime('%d/%m/%Y')
      value = (line[9, 10].strip.to_f) / 100
      cpf = line[19, 11].strip
      card = line[30,12].strip
      hour = line[42, 6].strip.scan(/[0-9]{2}/).join(':')
      owner_name = line[48, 14].strip
      provider_name = line[62, 19].strip

      {
        'transaction' => {transaction_type: type.to_i, transaction_date: date, value: value, hour: hour, card_number: card },
        'customer' => {cpf: cpf},
        'provider' => { name_owner: owner_name, name_provider: provider_name }
      }
    end

    def find_or_create_customer(customer)
      object = Customer.find_by(cpf: customer[:cpf])

      return object if object.present?
      Customer.create!(customer)
    end

    def find_or_create_provider(provider)
      object = Provider.find_by(name_provider: provider[:name_provider])

      return object if object.present?
      Provider.create!(provider)
    end
  end
end
