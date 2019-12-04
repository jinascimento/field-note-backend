require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do
  context 'when user is valid' do
    it '#create' do
      user = create(:user)
      post :create, params: { email: user.email, password: user.password}
      expect(response).to have_http_status(:created)
    end
  end
end
