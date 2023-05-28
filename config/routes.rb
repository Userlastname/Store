Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "home#index"
  get "about_us", to: "home#about_us"
  resources :products, :categories, only: [:index, :show]
  resources :carts
  post 'carts/:id/reduce', to: "carts#reduce_quantity", as: "reduce_qunt"
  post 'carts/:id/add', to: "carts#add_quantity", as: "add_qunt"
  delete "carts/:id", to: "carts#destroy", as: "destroy_item"
end
