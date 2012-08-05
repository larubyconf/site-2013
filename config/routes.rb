Larubyconf2013::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  get "main/videos"

  root :to => 'main#index'
end
