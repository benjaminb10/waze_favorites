Rails.application.routes.draw do
  resources :samples
  resources :samples
  root to: 'pages#index'
  match '/', to: 'pages#index', via: :post, as: 'pages-index'
  resources :searches
end
