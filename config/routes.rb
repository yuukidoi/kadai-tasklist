Rails.application.routes.draw do
  
  root to: 'tasks#index'  
 get 'signup', to: 'users#new'
  #post 'signup', to: 'users#create'
  #get 'users/index'
  #get 'users/show'
  #get 'users/new'
  #post 'users/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  resources :tasks
  resources :users, only: [:index, :show, :new, :create]
end
