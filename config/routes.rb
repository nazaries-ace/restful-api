Rails.application.routes.draw do
  
  devise_for :users
  namespace :api, defaults: { format: :json } do
    post 'authenticate', to: 'authentication#authenticate'
    resources :students, only: [:index, :show, :create, :update, :destroy]
    resources :courses, only: [:index, :show, :create, :update, :destroy]
  end
  
end
