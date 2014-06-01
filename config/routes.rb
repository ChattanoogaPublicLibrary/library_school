Rails.application.routes.draw do
  resources :proposals
  get 'proposals/:id/vote', to: 'proposals#vote', as: :proposal_vote

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :courses, except: :new
  get 'courses/new/:proposal/', to: 'courses#new', as: :new_course

  root :to => "visitors#index"
  devise_for :users
  resources :users

end
