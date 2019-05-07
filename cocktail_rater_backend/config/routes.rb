Rails.application.routes.draw do
  resources :reviews
  resources :dislikes
  resources :likes
  resources :ingredients
  resources :drinks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
