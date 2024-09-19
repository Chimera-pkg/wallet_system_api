class TransactionsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_wallets, only: [:create]
  skip_before_action :verify_authenticity_token, only: [:create]
  protect_from_forgery with: :null_session

  def create
    transaction = Transaction.new(transaction_params)
    if transaction.save
      render json: transaction, status: :created
    else
      render json: transaction.errors, status: :unprocessable_entity
    end
  end

  private

  def set_wallets
    @source_wallet = Wallet.find_by(id: params[:source_wallet_id])
    @target_wallet = Wallet.find_by(id: params[:target_wallet_id])
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :source_wallet_id, :target_wallet_id)
  end
end
