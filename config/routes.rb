Rails.application.routes.draw do
  resources :courses

  root :to => "visitors#index"
  devise_for :users
  resources :users
end
