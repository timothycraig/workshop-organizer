Rails.application.routes.draw do
  root 'staticpages#home'
  get '/about' => 'staticpages#about'

  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :workshops
    end
  end

  resources :profiles
  resources :workshops
  resources :user_workshops, only: [:create]
end
