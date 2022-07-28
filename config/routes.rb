Rails.application.routes.draw do
  
  get 'top' => 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  root to: 'homes#top'
  devise_for :users
  
  
  resources :books, only:[:index, :show, :create, :edit, :update]
  resources :users, only:[:show, :edit, :update]
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
