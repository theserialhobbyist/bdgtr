Rails.application.routes.draw do
  resources :categories do
    resources :charges
end
end
