class CreateTransactions < ActiveRecord::Migration[6.1]
    def change
      create_table :transactions do |t|
        t.references :source_wallet, null: true, foreign_key: { to_table: :wallets }
        t.references :target_wallet, null: true, foreign_key: { to_table: :wallets }
        t.decimal :amount, precision: 10, scale: 2
  
        t.timestamps
      end
    end
  end
  