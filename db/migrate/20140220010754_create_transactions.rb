class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :transaction_type
      t.decimal :amount
      t.references :consultation, index: true
      t.datetime :date
      t.string :payment_type

      t.timestamps
    end
  end
end
