class Transaction < ApplicationRecord
  belongs_to :source_wallet, class_name: 'Wallet', optional: true
  belongs_to :target_wallet, class_name: 'Wallet', optional: true

  validates :amount, numericality: { greater_than: 0 }
  validate :validate_wallets

  def validate_wallets
    if source_wallet.nil? && target_wallet.nil?
      errors.add(:base, "At least one wallet must be present")
    elsif source_wallet.present? && target_wallet.present?
      errors.add(:base, "Cannot have both source and target wallets")
    end
  end

  after_create :perform_transaction

  def perform_transaction
    Transaction.transaction do
      if source_wallet
        source_wallet.withdraw(amount)
      end
      if target_wallet
        target_wallet.deposit(amount)
      end
    end
  end
end
