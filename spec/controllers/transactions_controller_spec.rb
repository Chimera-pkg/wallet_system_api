require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  let(:source_wallet) { create(:wallet, balance: 100) }
  let(:target_wallet) { create(:wallet, balance: 50) }

  describe 'POST create' do
    context 'with valid parameters' do
      it 'creates a transaction and transfers money' do
        post :create, params: { transaction: { amount: 30, source_wallet_id: source_wallet.id, target_wallet_id: target_wallet.id } }
        
        expect(response).to have_http_status(:created)
        expect(source_wallet.reload.balance).to eq(70)
        expect(target_wallet.reload.balance).to eq(80)
      end
    end

    context 'with invalid parameters' do
      it 'returns validation errors' do
        post :create, params: { transaction: { amount: 30 } }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
