Rails.application.routes.draw do

  root 'main#index'

  get 'resumes/new' => 'resumes#new'
  get 'resumes/create' => 'resumes#create'

<<<<<<< HEAD
  
=======
>>>>>>> f46cab42fdc9361544c6ebae5a1b73019cd3bd12
  get 'auth/logout'

  get 'signup' => 'user#new'
  post 'signup' => 'user#create'

<<<<<<< HEAD

  get 'dashboard' =>'dashboard#show'
=======
  get 'dashboard' =>'dashboard#show'

>>>>>>> f46cab42fdc9361544c6ebae5a1b73019cd3bd12
  get 'dashboard/deck/new' => 'deck#new'
  get 'dashboard/deck/:id' => 'deck#show'
  put 'dashboard/deck/:id' => 'deck#update'

  get 'auth/login' => 'auth#login'
  get 'auth/logout' => 'auth#logout'
  get 'auth/failure' => 'auth#failure'
  post 'auth/callback' => 'auth#callback'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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

  resources :resumes, only: [:index, :new, :create, :destroy]
end
