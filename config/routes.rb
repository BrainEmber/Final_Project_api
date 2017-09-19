Rails.application.routes.draw do
  resources :fusers
  resources :musers
  resources :ledgers
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
