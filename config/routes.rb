Rails.application.routes.draw do
  devise_for :users
  # actmin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  #photos controller
  get "my_photos",     to:"photos#my_photos",  as:"my_photos"
  resources :photos

  # get 'photos/new',    to:'photos#new',        as:'photo_new'

  # get "my_photos",     to:"photos#my_photos",  as:"my_photos"
  # post 'photos',       to:'photos#create',     as:'photo_create'
  # get 'photos/:id',    to:'photos#show',       as:'photo_detail'

  # get 'photos/:id/edit', to:'photos#edit',     as:'photo_edit'
  # patch 'photos/:id',    to:'photos#update',   as:'photo_update'
  # delete 'photos/:id',    to:'photos#destroy',     as:'photo_destroy'
  #welcome controller
  #get 'photos', to:'photos#index',     as:'welcome_home'


  # get "login",  to: 'users#login',        as:'login'
  # post "login", to: 'users#new_session',  as:'user_new_session'
  # get "logout", to: 'users#logout',       as:'logout'
  #api
  #/api/v1/asdasd
  namespace :api do
     namespace :v1 do
       resources :users, except: [:new,:edit]
       resources :photos, except:[:new,:edit]
     end
  end
  #rutas del api:
  #USER
  #GET - http://localhost:3000/api/v1/photos
  #POST - http://localhost:3000/api/v1/users?user[name]=francisca&user[email]=francisca@gmail.com&user[password]=123456
  #GET -  http://localhost:3000/api/v1/users/1
  #PUT - http://localhost:3000/api/v1/users/2?user[name]=pepito&user[email]=pepito@gmail.com
  #DELETE - http://localhost:3000/api/v1/users/5
  
  #PHOTO
  #GET - http://localhost:3000/api/v1/photos




  #root
  root to:"photos#index"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
