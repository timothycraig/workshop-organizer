Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
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
  # get "*path" =>
end
