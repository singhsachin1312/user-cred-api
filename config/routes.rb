Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :users, only: [:index]
    post "user", to: "users#create"
    get "user/:id", to: "users#show"
    put "user/:id", to: "users#update"
    delete "user/:id", to: "users#destroy"
    get 'typeahead/:input' => 'users#typeahead'
  end
end
