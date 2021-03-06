RescueRails::Application.routes.draw do

  match "/adopters/check_email" => "adopters#check_email"
  match "/dogs/switch_view" => "dogs#switch_view"

  resources :adopters do
    resources :comments
  end

  resources :adoption_app

  resources :users
  resources :dogs do
    get :autocomplete_breed_name, :on => :collection
    resources :comments
  end
  resources :sessions, :only => [:new, :create, :destroy]
  resources :password_resets

  match '/events/past',  :to => 'events#past'
  resources :events

  

  match '/signin',       :to => 'sessions#new'
  match '/signout',      :to => 'sessions#destroy'
  match '/adopt',        :to => 'adopters#new'

  match '/contact',      :to => 'pages#contact'

  root                   :to => 'pages#home'
  match '/guide',        :to => 'pages#guide'
  match '/aboutus',      :to => 'pages#aboutus'
  match '/contributors', :to => 'pages#contributors'
  match '/volunteer',    :to => 'pages#volunteer'
  match '/foster',       :to => 'pages#foster'
  match '/fosterfaq',    :to => 'pages#fosterfaq'
  
  match '/resources',    :to => 'pages#resources'
  match '/puppyguide',   :to => 'pages#puppyguide'
  match '/shopping',     :to => 'pages#shopping'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
