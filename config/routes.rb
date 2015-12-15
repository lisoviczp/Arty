Rails.application.routes.draw do

  root to: "artworks#index"
  get 'sign_in' => 'signin#index', as: :sign_in


  devise_for :artists
  devise_for :users
  resources :artworks
  resources :artists
  resources :users
  resources :messages

  resources :models

  # get to the commission page
  get '/artists/:id/commission_page', to: 'artists#commission_page', as: :commission_page

  # call the actual URL for sending the commission email
  post '/artists/:id/commission_artist', to: 'artists#commission_artist', as: :commission_artist
  # get '/artists/:id/commission_artist', to: 'artists#commission_artist', as: :commission_artist

  
  get '/artists/:id/messages', to: 'artists#messages', as: :artist_messages


  get '/messages/:id/accept', to: 'messages#accept', as: :accept_message
  get '/messages/:id/decline', to: 'messages#decline', as: :decline_message






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
