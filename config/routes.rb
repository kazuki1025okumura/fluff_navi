Rails.application.routes.draw do
  root to: 'home#index'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :facilities, only: %i[index show] do
    collection do
      get :bookmarks
    end
  end
  resources :bookmarks, only: %i[create destroy]
end
