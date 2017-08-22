Rails.application.routes.draw do

  resources :posts
  resources :contacts

  root 'welcome#index'

end
