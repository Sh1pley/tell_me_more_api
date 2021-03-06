Rails.application.routes.draw do
  use_doorkeeper
  get "/", to: "api/v1/users#sync"
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      get "users/sync", to: "users#sync"
      resources :users, only: [:index, :show, :destroy, :create, :update]
    end
  end
  resources :nope, only: [:show]

end
