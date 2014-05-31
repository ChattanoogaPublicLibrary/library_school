Rails.application.routes.draw do
  resources :proposals

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :courses

  root :to => "visitors#index"
  devise_for :users
  resources :users
end
