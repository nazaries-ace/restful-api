Rails.application.routes.draw do
  
  namespace :api, defaults: { format: :json } do
    resources :students, only: [:index, :show, :create, :update, :destroy]
    resources :courses, only: [:index, :show, :create, :update, :destroy]
  end
  
end
