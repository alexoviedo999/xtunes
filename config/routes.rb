Xtunes::Application.routes.draw do

  resources :posts
  resources :artists
  resources :albums
  resources :genres
  resources :purchases
  resources :charges

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  resources :balance
  # get "balance" => "balance#new", :as => "balance"

  resources :users
  resources :sessions

  resources :songs do
    resources :purchases
  end

  resources :home do
    get 'song'
  end

  resources :mixtapes do
    resources :shares, :only => [:new, :create]
  end

  root :to => 'home#index'

end
