Rails.application.routes.draw do
  use_doorkeeper
  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :users, only: [:index, :show, :destroy, :create, :update]
      get "/login", to: "sessions#new"
    end
  end

end
