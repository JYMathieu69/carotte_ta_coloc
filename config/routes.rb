Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'ongoing_tasks#index'

  resources :colocs, only: [:new, :create, :edit, :update] do
    resources :colocs_tasks, only: [:new, :create], as: 'tasks'
  end
  get '/colocs/:id/recap', to: 'colocs#recap'
  get '/colocs/:id/invitation', to: 'colocs#invitation'

  scope do
    resources :ongoing_tasks, path: 'dashboard', only: [:index, :update] do
      resources :votes, only: [:create]
    end
    resources :coloc_tasks, path: 'task_manager', only: [:index, :create, :update, :destroy]
  end
end
