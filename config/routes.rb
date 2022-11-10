Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  ActiveAdmin.routes(self)
  namespace :admin do
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout',to: 'user_sessions#destroy'
  end

  root to: 'home#index'
  get 'terms_of_service', to: 'static_pages#terms_of_service'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  get 'concept', to: 'static_pages#concept'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider

  get '/sitemap', to: redirect("https://s3-ap-northeast-1.amazonaws.com/fluff-maps/sitemaps/sitemap.xml.gz")

  resources :users, only: %i[new create]
  resources :facilities, only: %i[index show] do
    resources :posts, only: %i[new create show destroy], shallow: true
    resources :reports, only: %i[new create], shallow: true
    collection do
      get :bookmarks
      get :animal
      get :category
      get :all
    end
  end
  resources :bookmarks, only: %i[create destroy]
  resource :profile, only: %i[edit show update]
  resources :password_resets, only: %i[new create edit update]
end
