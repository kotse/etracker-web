ETracker::Application.routes.draw do

  get 'reports/index'
  get 'reports/expenses_by_tag'
  get 'reports/expenses_over_time'

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :assets
  resources :expenses
  resources :tags
end