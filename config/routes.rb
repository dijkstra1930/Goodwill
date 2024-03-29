Goodwill::Application.routes.draw do
  devise_for :users
  resources :products, only: [:create, :destroy]

  resources :users

	#match "/", :to => "products#index", :via => 'get'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'static_pages#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # static routes
  get '/about', to: 'static_pages#about', as: 'about'
  get '/token' => 'home#token', as: :token

  # session routes
  devise_scope :user do
    get "/login" => "devise/sessions#new"
  end

  devise_scope :user do
    delete "/logout" => "devise/sessions#destroy"
  end

  devise_scope :user do
    get "/sign_up" => "devise/registrations#new"
  end

  # Ajax routes
  post 'check_email', to: 'users#check_email'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
