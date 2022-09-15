Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  namespace :admin do
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout',to: 'user_sessions#destroy'
  end

  root to: 'home#index'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :facilities, only: %i[index show] do
    resources :posts, only: %i[new create show destroy], shallow: true
    collection do
      get :bookmarks
    end
  end
  resources :bookmarks, only: %i[create destroy]
  resource :profile, only: %i[edit show update]
end
