Rails.application.routes.draw do
  devise_for :users

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'ongoing_tasks#index'

  resources :users, only: [:update, :edit]
  resources :colocs, only: [:new, :create, :edit, :update] do
    resources :coloc_tasks, only: [:new, :destroy]
  end
  resources :coloc_tasks, only: :create
  resources :carotted_tasks, only: [:show]

  get '/colocs/:id/choose_tasks', to: 'colocs#choose_tasks', as: 'choose_tasks'
  get '/colocs/:id/recap', to: 'colocs#recap', as: 'recap'
  get '/colocs/:id/invitation', to: 'colocs#invitation'
  delete '/colocs/:id/:user_id/remove_coloc_user', to: 'colocs#remove_coloc_user', as: 'remove_coloc_user'
  get '/home', to: 'pages#home'
  get '/join', to: 'colocs#join', as: 'join_coloc'
  post "start_ongoing_tasks", to: "ongoing_tasks#start_ongoing_tasks"
  get '/dashboard/:id/validate_task', to: 'ongoing_tasks#validate_task', as: 'validate_task'
  patch '/dashboard/:id/validation_update', to: 'ongoing_tasks#validation_update', as: 'validation_update'

  scope do
    resources :ongoing_tasks, path: 'dashboard', only: [:index, :update, :show] do
      resources :votes, only: [:create]
      resources :carotted_tasks, only: [:create]
    end
    resources :tasks, path: 'admin', except: [:show, :new]
  end

  #routes for API
  mount API::Base, at: "/"
end
