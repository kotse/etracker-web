ETracker::Application.routes.draw do
  get 'asset/index'

  get 'asset/create'

  get 'asset/destroy'

  get 'asset/edit'

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end