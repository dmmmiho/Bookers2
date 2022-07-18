Rails.application.routes.draw do
  
  get 'top' => 'homes#top'
  root to: 'homes#top'
  devise_for :users
  
  get 'users/show'
  get 'users/edit'
  get 'books/new'
  get 'books/index'
  get 'books/show'
  get 'books/edit'
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
