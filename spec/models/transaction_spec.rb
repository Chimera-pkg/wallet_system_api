require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:source_wallet) { create(:wallet, balance: 100) }
  let(:target_wallet) { create(:wallet, balance: 50) }

  it 'transfers money from source to target' do
    transaction = Transaction.create!(source_wallet: source_wallet, target_wallet: target_wallet, amount: 30)

    expect(source_wallet.reload.balance).to eq(70)
    expect(target_wallet.reload.balance).to eq(80)
  end

  it 'raises validation error if both source and target wallets are present' do
    transaction = Transaction.new(source_wallet: source_wallet, target_wallet: target_wallet, amount: 50)
    transaction.save
    expect(transaction.errors[:base]).to include("Cannot have both source and target wallets")
  end
end
