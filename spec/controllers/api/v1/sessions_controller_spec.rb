require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do
  context 'when user is valid' do
    it '#create' do
      user = create(:user)
      post :create, params: { email: user.email, password: user.password}
      expect(response).to have_http_status(:created)
    end
  end

  context 'when user is invalid' do
    it '#create' do
      user = create(:user)
      post :create, params: { email: 'emailinvalido@invalido.com', password: user.password}
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
