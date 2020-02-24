Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: 'boards#index'
  resources :boards do
    resources :comments
  end
  resources :users 
  
    


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
