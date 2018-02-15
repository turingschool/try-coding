Rails.application.routes.draw do
  root 'application#index'
  post '/contact', to: 'application#contact'

  resources :events, only: [:show]
end
