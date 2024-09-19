require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { create(:user, email: 'test@example.com', password: 'password') }

  describe 'POST create' do
    context 'with valid credentials' do
      it 'logs in the user' do
        post :create, params: { email: user.email, password: 'password' }
        
        expect(response).to have_http_status(:ok)
        expect(session[:user_id]).to eq(user.id)
      end
    end

    context 'with invalid credentials' do
      it 'returns unauthorized' do
        post :create, params: { email: user.email, password: 'wrongpassword' }

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE destroy' do
    it 'logs out the user' do
      session[:user_id] = user.id
      delete :destroy
      
      expect(session[:user_id]).to be_nil
      expect(response).to have_http_status(:ok)
    end
  end
end
