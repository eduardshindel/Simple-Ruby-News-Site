Rails.application.routes.draw do
  get 'hello/index'
  get '/categories/any', to: redirect('articles#index')
  get '/categories/:id', to: 'categories#show'
  resources :articles
  root :to => "articles#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
