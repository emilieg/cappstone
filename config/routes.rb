Rails.application.routes.draw do


  # get 'resumes/index'

  get 'resumes/new' => 'resumes#new'

  get 'resumes/create' => 'resumes#create'

  # get 'resumes/destroy'

  # get 'auth/logout'


  get 'calendar/add'

  get 'calendar/edit'


  get 'auth/logout'

  root 'main#index'

  get 'signup' => 'user#new'
  post 'signup' => 'user#create'


  # get 'login' => 'sessions#new'
  # post 'login' => 'session#create'
  # get 'logout' => 'sessions#destroy'

  get 'dashboard/deck/new' => 'deck#new'
  get 'dashboard/deck/:id' => 'deck#show'
  put 'dashboard/deck/:id' => 'deck#update'

  get 'deck' => 'deck#index'

  post 'deck' => 'deck#create'

  post 'deck/note' => 'deck#create_note'

  get 'deck/show' => 'deck#show'


  get 'dashboard/deck/:id' => 'deck#show'
  get 'dashboard/deck/new' => 'deck#new'
  get 'deck/new' => 'deck'
  post 'deck/new' => 'deck#new'
  get '/deck' => 'deck#show'
<<<<<<< HEAD

=======
>>>>>>> e10fbf2fcd67e94be5fc0f30aab188d874b18bad

  get 'auth/login' => 'auth#login'
  get 'auth/logout' => 'auth#logout'
  get 'auth/failure' => 'auth#failure'
  post 'auth/callback' => 'auth#callback'

  get 'dashboard' =>'dashboard#show'

  get 'upload_test' => 'main#upload_test'


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
