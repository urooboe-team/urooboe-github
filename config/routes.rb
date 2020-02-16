Rails.application.routes.draw do

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
    }
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
    }

#管理者側のrouting
  namespace :admin do
    resources :products, only: [:new, :index, :show, :create, :edit, :update]
  end

  namespace :admin do
    resources :orders, only: [:index, :show, :update]
  end

  namespace :admin do
    resources :genres, only: [:new, :index, :edit, :create, :update]
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end

#会員側のrouting
 resources :addresses, only: [:index, :edit, :create, :update, :destroy]

 resources :cart_items, only: [:index, :create, :update, :destroy]
 resource :customer, only: [:show, :edit, :withdraw, :update, :destroy]

 # get '/my_page' => 'customers#show' ,as: 'my_page'

 get 'homes/about'  => "homes#about"

 get '/withdraw' => "customers#withdraw"
 get '/comfirm' => "orders#comfirm"
 post '/comfirm' => "orders#comfirm"
 resources :orders, only: [:new, :thanks, :index, :show, :create, :comfirm]
 resources :products, only: [:index, :show]

 root to: "products#index"
 get 'thanks' => "orders#thanks"

 end