Rails.application.routes.draw do
  root to: 'users#index'
  resources :users

  api_version(module: 'Api::V1', path: { value: 'api/v1' }) do
    resources :geolocations
    resources :annotations
    resources :sessions, only: [:create]
  end
end