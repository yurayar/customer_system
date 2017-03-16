Rails.application.routes.draw do
  scope '/api' do
    scope '/agreements' do
      get '/' => 'api_agreements#show'
    end
  end
  root to: 'dashboard#index'
  resources :addresses
  resources :agreements
  resources :companies
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dashboard
end
