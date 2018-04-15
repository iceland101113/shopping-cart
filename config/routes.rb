Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show]

  root "products#index"

  get "addto_cart", to: "products#addto_cart" 

  namespace :admin do
    resources :products
    root "products#index"
  end

end
