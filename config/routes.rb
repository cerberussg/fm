Rails.application.routes.draw do
  resources :federations do
    resources :divisions
  end
  root to: 'federations#index'
end
