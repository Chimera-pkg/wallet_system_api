class CreateWallets < ActiveRecord::Migration[6.1]
    def change
      create_table :wallets do |t|
        t.references :entity, polymorphic: true, null: false
        t.decimal :balance, default: 0, precision: 10, scale: 2
  
        t.timestamps
      end
    end
  end
  