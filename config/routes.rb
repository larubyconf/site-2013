Larubyconf2013::Application.routes.draw do

  resource :travel, :only => [:show]

  resources :workshops, :only => [:index]

  resource :venue, :only => [:show]

  resources :speakers, :only => [:index]

  resource :schedule, :only => [:show]

  resource :my_account

  resources :sponsors

  resources :proposals

  mount RailsAdmin::Engine => '/radmin', :as => 'rails_admin'

  devise_for :users

  get "main/videos"

  get "/admin" => 'main#admin'

  namespace :admin do
    resources :photos
    resources :sponsors
  end

  root :to => 'main#index'
end
