Rails.application.routes.draw do
  namespace :admin do
    resources :orders
    resources :catagories
    resources :products do
      resources :stocks
    end
  end
  devise_for :admins
    as :admin do
    get 'admins/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
    authenticate :admin_user do
        root "admin#index", as: :admin_root
    end
    get "admin" => "admin#index"
end
