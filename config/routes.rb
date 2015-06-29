SISANPRO::Application.routes.draw do
  root :to => "users#index"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :customer_services, only: [:show, :index]
  resources :suppliers, only: [:show, :index]
  resources :unity_procons
  resources :faqs
  resources :ratings, only: [:show, :index]
  resources :cdcs

  get '/add_rating' => 'unity_procons#update'
  get '/signup' => 'users#new'
  get '/signin' => 'sessions#new'
  get '/signout' => 'sessions#destroy', via: :delete
  get '/allusers' => 'users#allusers'
  get '/ranking' => 'unity_procons#ranking'
  get '/faq' => 'faqs#index'
  get '/cdc' => 'cdcs#index'
  get '/avaliar' => 'ratings#index'

  get "/graphs", to: 'customer_services#graphs'

  get '/list', to: 'customer_services#list'
  get "/customer_service/filter_customer_service_by_type", to: "customer_services#filter_customer_service_by_type"
  get "/customer_service/filter_customer_service_by_type_region", to: "customer_services#filter_customer_service_by_type_region"
  get "/customer_service/custom_search", to: "customer_services#custom_search"
  get "/customer_service/index", to: "customer_services#index"
  get "/unity_procon/custom_search", to: "unity_procons#custom_search"
  get "/supplier/custom_search", to: "suppliers#custom_search"
  get "/unity_procon/custom_search_ranking", to: "unity_procons#custom_search_ranking"
  #get "/rating/avaliar", to: "ratings#add_rating"

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
