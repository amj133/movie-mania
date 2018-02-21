Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/movies', to: "movies#index"
  root "welcome#index"

  # resources :movies
  # resources :directors
  # above those resources are independent

  resources :directors, shallow: true do
    resources :movies
  end

  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :categories, only: [:index]
  end
  # any custom routes (except root) should be below other resources
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
