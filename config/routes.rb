Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show]

  root "products#index"

  get "addto_cart", to: "products#addto_cart" 
  get "in_quantity", to: "products#in_quantity"
  get "de_quantity", to: "products#de_quantity"

  namespace :admin do
    resources :products
    root "products#index"
  end

end
