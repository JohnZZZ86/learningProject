Rails.application.routes.draw do
  #get 'stores/index'
  root 'stores#index'
  resources :stores
end
