Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'orders#index'

  resources :orders, only: [:index, :show, :create] do
    member do
      post :payment_process_request
    end
    collection do
      post :payment_process_callback
    end
  end
end
