Rails.application.routes.draw do
  resources :categories do
    resources :charges
end
resources :users

resources :user_sessions, only: [ :new, :create, :destroy ]

get 'login'  => 'user_sessions#new'
get 'logout' => 'user_sessions#destroy'
end
