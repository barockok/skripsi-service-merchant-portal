Rails.application.routes.draw do
  resources :merchants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/notifications' => 'application#notifications'
end