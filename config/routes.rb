Rails.application.routes.draw do
  root 'staticpages#home'
  get '/about' => 'staticpages#about'

  devise_for :users

  resources :workshops
end
