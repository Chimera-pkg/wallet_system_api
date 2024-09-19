class Wallet < ApplicationRecord
    belongs_to :entity, polymorphic: true
    has_many :transactions
  
    validates :balance, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
    def deposit(amount)
      self.balance += amount
      save!
    end
  
    def withdraw(amount)
      raise "Insufficient balance" if amount > self.balance
      self.balance -= amount
      save!
    end
  end
  