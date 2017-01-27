Rails.application.routes.draw do
  resources :users do
    resources :categories do
      resources :charges
    end
  end

  resources :user_sessions, only: [ :new, :create, :destroy ]

  get 'login'  => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'
end
