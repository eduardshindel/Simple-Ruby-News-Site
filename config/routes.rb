Rails.application.routes.draw do
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get '/categories/any', to: redirect('articles#index')
  get '/categories/:id', to: 'categories#show'
  resources :articles
  root to: 'articles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
