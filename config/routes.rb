Rails.application.routes.draw do
  resources :federations do
    resources :divisions
    resources :shows
  end
  root to: 'federations#index'
end
