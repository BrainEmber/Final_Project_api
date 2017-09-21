Rails.application.routes.draw do
  resources :fusers do
    collection do
      post '/login', to: 'fusers#login'
    end
  end

  resources :musers do
    collection do
      post '/login', to: 'musers#login'
    end
  end
  resources :ledgers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
