Rails.application.routes.draw do
  root to: 'users#index'
  resources :users
  post '/auth/login', to: 'authentication#login'

  api_version(module: 'Api::V1', path: { value: 'api/v1' }) do
    resources :geolocations
    resources :annotations
    post '/auth/login', to: 'authentication#login'
  end
end