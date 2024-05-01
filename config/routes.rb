Rails.application.routes.draw do
  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'user_sessions/destroy'
  get 'users/new'
  get 'users/create'

  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :users, only: %i[new create]

  root 'static_pages#top'

  get :sign_up, to: 'users#new'
  post :sign_up, to: 'users#create'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  get 'tags/:tag_name', to: 'items#index', as: :tag
  
  # resources :items do
  #   collection do
  #     get 'search' # postsのコレクションルートとしてsearchアクションを追加
  #   end
  #   resources :comments, module: :posts
  # end

  if Rails.env.development? || Rails.env.test?
    get 'login_as/:user_id', to: 'development/sessions#login_as'
  end
end
