Rails.application.routes.draw do
  resources :users
  resources :transactions,  only:[:update,:create,:destroy,:index]
  resources :goals
  post "/signup", to: "users#create"
  get "/me", to: "users#show"
   post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
