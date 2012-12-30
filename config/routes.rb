Larubyconf2013::Application.routes.draw do

  match '/users/auth/:provider/callback' => 'authentications#create'

  devise_for :users, :controllers => {
    :registrations => 'registrations'
  }

  resources :clicks, :only => [:show]
  
  resources :authentications
  
  resources :news_items, :only => [:index, :show]

  resource :travel, :only => [:show]

  resources :workshops, :only => [:index, :show]

  resource :venue, :only => [:show]

  resources :speakers, :only => [:index]

  resource :schedule, :only => [:show]

  resource :my_account do
    resources :proposals, :only => [] do
      resources :votes, :only => [] do
        get 'up', :on => :collection
        get 'down', :on => :collection
      end
    end
  end

  resources :sponsors

  resources :proposals, :except => [:new, :create]

  mount RailsAdmin::Engine => '/radmin', :as => 'rails_admin'

  get "/videos" => 'main#videos'

  get "/admin" => 'main#admin'

  namespace :admin do
    resources :photos
    resources :sponsors
    resources :news_items
    resources :users
    resources :workshops
    resources :proposals do
      resources :comments
      put 'accept', :on => :member
      put 'reject', :on => :member
      put 'consider', :on => :member
      put 'clear', :on => :member
      put 'confirm', :on => :member
    end
  end

  match '/privacy' => 'main#privacy'
  
  root :to => 'main#index'
end
