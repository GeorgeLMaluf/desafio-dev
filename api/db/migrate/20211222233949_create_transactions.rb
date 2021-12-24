class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer "transaction_type"
      t.string "nature"
      t.boolean "signal"
      t.float "value"
      t.date "transaction_date"
      t.string "hour"
      t.string "card_number"
      t.bigint "customer_id"
      t.bigint "provider_id"
      t.index ["customer_id"], name: "index_transactions_on_customer_id"
      t.index ["provider_id"], name: "index_transactions_on_provider_id"
      t.timestamps
    end
  end
end
