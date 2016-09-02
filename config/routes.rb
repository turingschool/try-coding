Rails.application.routes.draw do
  root 'application#index'
  post '/contact', to: 'application#contact'
end
