Rails.application.routes.draw do
  resources :activitats
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      match '/activitats' => 'activitats#index', :via => :get
      match '/activitats/:id' => 'activitats#show', :via => :get
      match '/activitats/get_closest_ruta' => 'activitats#get_closest_ruta', :via => :post
      match '/activitats/activitats_by_distance' => 'activitats#activitats_by_distance', :via => :post

    end
  end

end
