Rails.application.routes.draw do
  
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root to: 'tasks#index'  
  
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  
  
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
