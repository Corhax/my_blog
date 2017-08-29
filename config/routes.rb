Rails.application.routes.draw do

  root 'welcome#index'

  resources :posts, only: [:index, :show]
  resources :projects, only:[:index, :show]
  resources :contacts, only:[:new, :create]

  namespace :admin do

    root 'welcome#index'
    resources :posts, :projects
    resources :contacts, only:[:new, :create]

    get '/login' => 'sessions#new'
    get '/logout' => 'sessions#destroy'
    post '/login' => 'sessions#create'
  end

end
