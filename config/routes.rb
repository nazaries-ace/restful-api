Rails.application.routes.draw do
  
  namespace :api, defaults: { format: :json } do
    resources :students, only: [:index]
    resources :courses, only: [:index]
  end
  
end
