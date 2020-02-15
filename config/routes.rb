Rails.application.routes.draw do
  devise_for :users
  root to: 'boards#index'
  resources :boards, only: [:new, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
