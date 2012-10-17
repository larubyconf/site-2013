Larubyconf2013::Application.routes.draw do

  match '/users/auth/:provider/callback' => 'authentications#create'

  devise_for :users, :controllers => {
    :registrations => 'registrations'
  }

  resources :authentications
  
  resources :news_items, :only => [:index, :show]

  resource :travel, :only => [:show]

  resources :workshops, :only => [:index]

  resource :venue, :only => [:show]

  resources :speakers, :only => [:index]

  resource :schedule, :only => [:show]

  resource :my_account

  resources :sponsors

  resources :proposals

  mount RailsAdmin::Engine => '/radmin', :as => 'rails_admin'

  get "main/videos"

  get "/admin" => 'main#admin'

  namespace :admin do
    resources :photos
    resources :sponsors
    resources :news_items
  end

  root :to => 'main#index'
end
