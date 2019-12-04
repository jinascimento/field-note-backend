require 'rails_helper'

RSpec.describe Api::V1::AnnotationsController, type: :controller do
  context 'when user is authenticated' do
    authenticate_token

    it '#index' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it '#create' do
      annotation = build(:annotation, user: @user)
      post :create, params: { annotation: annotation.attributes}
      expect(response).to have_http_status(:created)
    end

  end

  context 'when user is not authenticated' do

    it '#index' do
      get :index
      expect(response).to have_http_status(:unauthorized)
    end

    it '#create' do
      post :create
      expect(response).to have_http_status(:unauthorized)
    end

  end
end
