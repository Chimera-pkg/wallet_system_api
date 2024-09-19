class CreateEntities < ActiveRecord::Migration[6.1]
    def change
      create_table :users do |t|
        t.string :email, null: false
        t.string :password_digest
  
        t.timestamps
      end
  
      create_table :teams do |t|
        t.string :name, null: false
  
        t.timestamps
      end
  
      create_table :stocks do |t|
        t.string :symbol, null: false
  
        t.timestamps
      end
    end
  end
  