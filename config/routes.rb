Shopaholic::Application.routes.draw do

  resources :carts

  devise_for :users

  resources :brands

  resources :categories

  resources :wish_lists
  resources :orders
  resources :ratings
  resources :auctions do
    resources :biddings
  end
  resources :products do
    collection do
      get :brand_list
    end
  end
  root :to => "products#products_list"
  get '/add_to_cart/:product_id' => 'carts#add_to_cart', :as => 'add_to_cart'
  #get '/destroy/:product_id' => 'carts#destroy', :as => 'destroy'
  get '/view_cart/:product_id' => 'carts#view_cart', :as => 'view_cart'  
  post '/update_cart/:product_id' => 'carts#update_cart', :as => 'update_cart'
  match '/list' => 'products#products_list', :as => 'products_list' , via: [:get, :post]
  
  get '/add_to_wish_list/:product_id' => 'wish_lists#add_to_wish_list', :as => 'add_to_wish_list'
  get '/view_wish_list/:product_id' => 'wish_lists#view_wish_list', :as => 'view_wish_list'
  post '/update_wish_list/:product_id' => 'wish_lists#update_wish_list', :as => 'update_wish_list'
  get '/confirm_order' => 'orders#confirm_order', :as => 'confirm_order'
  get '/thank_you' => 'orders#thank_you', :as => 'thanks'
  get '/cancel' => 'orders#cancel', :as => 'cancel'
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
  # match ':controller(/:action(/:id))(.:format)'
end
