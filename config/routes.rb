Rails.application.routes.draw do
  scope '/api' do
    scope '/agreements' do
      get '/' => 'api_agreements#show'
    end
  end
  namespace :admin do
    resources :users
  end
  devise_for :users
  scope '/admin' do
    resources :users
  end
  root to: 'agreements#index'
  resources :addresses
  resources :agreements
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dashboard
  resources :admin
end
