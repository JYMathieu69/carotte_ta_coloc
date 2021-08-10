Rails.application.routes.draw do
  devise_for :users

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'ongoing_tasks#index'

  resources :users, only: [:update]
  resources :colocs, only: [:new, :create, :edit, :update] do
    resources :coloc_tasks, only: [:new, :create], as: 'tasks'
  end

  get '/colocs/:id/recap', to: 'colocs#recap'
  get '/colocs/:id/invitation', to: 'colocs#invitation'
  get '/home', to: 'pages#home'
  get '/join', to: 'colocs#join', as: 'join_coloc'
  scope do
    resources :ongoing_tasks, path: 'dashboard', only: [:index, :update, :show] do
      resources :votes, only: [:create]
      resources :carotted_tasks, only: [:create]
    end
    resources :coloc_tasks, path: 'task_manager', only: [:index, :create, :update, :destroy]
    resources :tasks, path: 'admin', except: [:show, :new]
  end

  
end
