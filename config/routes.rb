Rails.application.routes.draw do
  use_doorkeeper
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users, only: [:index, :show]
      post :users, to: "users#new"
      patch :users, to: "users#update"
      delete :users, to: "users#destroy"
      get "/login", to: "sessions#new"
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
