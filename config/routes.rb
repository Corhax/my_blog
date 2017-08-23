Rails.application.routes.draw do

  resources :posts
  resources :contacts, only:[:new, :create]
  resources :projects

  root 'welcome#index'

end
