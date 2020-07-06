Rails.application.routes.draw do
  devise_for :users
  # actmin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  #photos controller
  get 'photos/:id', to: "photos#show", as:'photo_detail'
  
  #welcome controller
  get 'welcome/index', to: "welcome#index", as:'welcome_home'


  get "login",  to: 'users#login', as:'login'
  get "logout", to: 'users#logout', as:'logout'
  #root
  root to:"welcome#index"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
