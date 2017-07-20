Rails.application.routes.draw do
  root 'welcome#index'

  resources :search_parameters
  resources :ratings
  post '/events/search', to: 'events#search', as: 'events_search'
  resources :events

  resources :app_users

  devise_scope :user do
    post 'app_login', to: 'auth_callbacks#app_login', as: 'app_login'
  end

  devise_for :users, :controllers => {:omniauth_callbacks => "auth_callbacks"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
