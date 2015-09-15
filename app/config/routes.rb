Rails.application.routes.draw do
  root to: 'pages#index'
  match '/', to: 'pages#index', via: :post, as: 'pages-index'
end
