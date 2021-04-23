Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts, only: %i[index show new create]
  resources :sessions, only: %i[new create destroy]
  root to: 'posts#index'
end
