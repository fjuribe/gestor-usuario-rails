Rails.application.routes.draw do
  devise_for :users
  # actmin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  #photos controller
  get 'photos/new',    to:'photos#new',        as:'photo_new'
  post 'photos',       to:'photos#create',     as:'photo_create'
  get 'photos/:id',    to:'photos#show',       as:'photo_detail'
  
  #welcome controller
  get 'photos', to:'photos#index',     as:'welcome_home'


  # get "login",  to: 'users#login',        as:'login'
  # post "login", to: 'users#new_session',  as:'user_new_session'
  # get "logout", to: 'users#logout',       as:'logout'
  #root
  root to:"photos#index"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
