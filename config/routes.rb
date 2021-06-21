Rails.application.routes.draw do
  # root "students#index"
  # get "/students", to: "student#index"
  namespace :api, defaults: { format: :json } do
    resources :students, only: [:index]
  end
  
end
