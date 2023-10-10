Rails.application.routes.draw do
  get 'books/new'
  get 'books/index'
  get 'books/show'
  devise_for :users
  get 'homes/top'=>'homes#top' 
  get '/'=>'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: 'homes#top'
  resources :books, only: [:new,:create, :index, :show,:destroy,:edit,:update]
   resources :users, only: [:show, :edit, :update,:create,:index]
   
  get"home/about" =>"homes#about" ,as:"about"

end
