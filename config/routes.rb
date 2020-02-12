Rails.application.routes.draw do

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :admin, module: :admin

  devise_for :customers,  module: :customers

#管理者側のrouting
  namespace :admin do
    resources :products, only: [:new, :index, :show, :create, :edit, :updete]
  end

  namespace :admin do
    resources :orders, only: [:index, :show, :updete]
  end

  namespace :admin do
    resources :genres, only: [:new, :index, :edit]
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :updete]
  end

#会員側のrouting
 resources :addresses, only: [:index, :edit, :create, :updete, :destroy]
 resources :cart_items, only: [:index, :create, :updete, :destroy]
 resource :customers, only: [:show, :edit, :withdraw, :updete]
 get 'homes/about'
 resources :orders, only: [:new, :thanks, :index, :show, :create, :comfirm]
 resources :products, only: [:index, :show]

 root to: "products#index"






 end