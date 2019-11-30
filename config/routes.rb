Rails.application.routes.draw do
  root to: 'users#index'
  resources :users
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'

  api_version(module: 'Api::V1', path: { value: 'api/v1' }) do
    post '/auth/login', to: 'authentication#login'
  end
end