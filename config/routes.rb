Rails.application.routes.draw do
  resources :users, only: %i[show destroy]
  get '/sign_up', to: 'users#new'
  post '/sign_up', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'home/index'
  root 'home#index'
  resources :articles, except: %i[index] do
    resources :likes, only: %i[create destroy]
  end
  resources :categories, only: %i[index show]
end
