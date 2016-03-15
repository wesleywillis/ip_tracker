Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'districts#index'

  get "/.well-known/acme-challenge/#{ENV['LE_AUTH_REQUEST']}", to: 'districts#letsencrypt'


  post 'districts/sms' => 'districts#sms', as: :sms
  post 'districts/gps' => 'districts#gps', as: :gps

  get 'api/districts/:id/shifts', to: 'api_alerts#bad_shifts'
  get 'api/districts/:id/dormant', to: 'api_alerts#dormant_cases'
  get 'districts/:id/dormant', to: 'districts#dormant', as: :dormant
  get 'districts/:id/shift_alerts', to: 'districts#shift_alerts', as: :shift_alerts

  resources :districts do
    resources :clients
    resources :workers
  end
  #post '/send_text' => 'welcome#send_text'

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
