Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"

  resources :products, except: :destory do
    resources :purchase_users, only:[:create, :index, :new]
  end
  resources :addresses, only:[:create, :index, :new]
end