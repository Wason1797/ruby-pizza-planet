Rails.application.routes.draw do
  resources :orders, path: 'order'
  resources :sizes, path: 'size'
  resources :ingredients, path: 'ingredient'

  get '/ingredient/id/:id' => 'ingredients#show'
  get '/order/id/:id' => 'orders#show'
  get '/size/id/:id' => 'size#show'

  put '/ingredient' => 'ingredients#update'
end
