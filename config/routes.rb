Rails.application.routes.draw do
  resources :mining_types
  get 'welcome/index'
  resources :coins
  resources :articles
  root to: 'welcome#index'
  #get 'articles', to: 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
