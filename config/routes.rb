Rails.application.routes.draw do
  resource :home, only: [:show], controller: :home
  resource :team, only: [:show], controller: :team
  resource :about, only: [:show], controller: :about
  resource :legal, only: [], controller: :legal do
    collection do
      get :terms
      get :privacy
      get :eula
    end
  end
  resource :contact, only: [:new, :create], controller: :contact
  resources :games
  resources :identities
  resources :subscriptions, only: [:new, :create]
  resources :quiz, only: [:new, :create, :show], controller: :quiz

  resource :liag, only: [:show], controller: :liag do
    get :characters
    get :features
    get :faq
    get :media
    get :press
    get :late_pledge
    get :thank_you
  end

  resources :downloads, only: [:index]

  get 'acen' => 'liag#show'

  root 'home#show'

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
end
