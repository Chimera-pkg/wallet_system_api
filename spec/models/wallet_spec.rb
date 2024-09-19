require 'rails_helper'

RSpec.describe Wallet, type: :model do
  let(:user) { create(:user) }
  let(:wallet) { create(:wallet, entity: user, balance: 100) }

  it 'initializes with the correct balance' do
    expect(wallet.balance).to eq(100)
  end

  it 'deposits money successfully' do
    wallet.deposit(50)
    expect(wallet.reload.balance).to eq(150)
  end

  it 'raises error on withdraw if balance is insufficient' do
    expect { wallet.withdraw(200) }.to raise_error("Insufficient balance")
  end

  it 'withdraws money successfully' do
    wallet.withdraw(30)
    expect(wallet.reload.balance).to eq(70)
  end
end
