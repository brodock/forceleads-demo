Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get '/create', to: 'home#create'

  # OAuth
  namespace :services do
    resource :oauth2, controller: :oauth2, only: [:edit, :create, :update] do
      get 'authorize', :on => :collection
      get 'callback', :on => :collection
    end
  end
end
