Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get '/create', to: 'home#create'

  # OAuth
  get '/authorize', to: 'services/oauth2#authorize'
  get '/services/oauth2/callback', to: 'services/oauth2#callback'
end
