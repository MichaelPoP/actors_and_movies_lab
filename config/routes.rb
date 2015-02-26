Rails.application.routes.draw do

root 'site#index'

  # resources :movies do
  #   resources :comments
  # end
  # resources :actors do
  #   resources :comments
  # end


  resources :movies do
    post '/comments/new' => 'comments#create', as: 'comments'
    delete '/comments/:id' => 'comments#destroy', as: 'remove'
  end

  resources :actors do
    post '/comments/new' => 'comments#create', as: 'comments'
    delete '/comment/:id' => 'comments#destroy', as: 'remove'
  end


 # post '/movies/:movie_id/comments/new' => 'comments#new', as: :add_movie_comment


  post '/movies/:id/actors/new' => 'movies#add_actor', as: :add_actor
  delete 'movies/:id/actors/:actor_id' => 'movies#remove_actor', as: :remove_actor

  post '/actors/:id/movies/new' => 'actors#add_movie', as: :add_movie
  delete '/actors/:id/movies/:movie_id' => 'actors#remove_movie', as: :remove_movie


#    Prefix Verb   URI Pattern                              Controller#Action
#           root GET    /                                        site#index
# movie_comments POST   /movies/:movie_id/comments/new(.:format) comments#create
#   movie_remove DELETE /movies/:movie_id/comments/:id(.:format) comments#destroy
#         movies GET    /movies(.:format)                        movies#index
#                POST   /movies(.:format)                        movies#create
#      new_movie GET    /movies/new(.:format)                    movies#new
#     edit_movie GET    /movies/:id/edit(.:format)               movies#edit
#          movie GET    /movies/:id(.:format)                    movies#show
#                PATCH  /movies/:id(.:format)                    movies#update
#                PUT    /movies/:id(.:format)                    movies#update
#                DELETE /movies/:id(.:format)                    movies#destroy
# actor_comments POST   /actors/:actor_id/comments/new(.:format) comments#create
#   actor_remove DELETE /actors/:actor_id/comment/:id(.:format)  comments#destroy
#         actors GET    /actors(.:format)                        actors#index
#                POST   /actors(.:format)                        actors#create
#      new_actor GET    /actors/new(.:format)                    actors#new
#     edit_actor GET    /actors/:id/edit(.:format)               actors#edit
#          actor GET    /actors/:id(.:format)                    actors#show
#                PATCH  /actors/:id(.:format)                    actors#update
#                PUT    /actors/:id(.:format)                    actors#update
#                DELETE /actors/:id(.:format)                    actors#destroy
#      add_actor POST   /movies/:id/actors/new(.:format)         movies#add_actor
#   remove_actor DELETE /movies/:id/actors/:actor_id(.:format)   movies#remove_actor
#      add_movie POST   /actors/:id/movies/new(.:format)         actors#add_movie
#   remove_movie DELETE /actors/:id/movies/:movie_id(.:format)   actors#remove_movie














  

  
# Prefix Verb   URI Pattern                                   Controller#Action
#               root GET    /                                             site#index
#     movie_comments GET    /movies/:movie_id/comments(.:format)          comments#index
#                    POST   /movies/:movie_id/comments(.:format)          comments#create
#  new_movie_comment GET    /movies/:movie_id/comments/new(.:format)      comments#new
# edit_movie_comment GET    /movies/:movie_id/comments/:id/edit(.:format) comments#edit
#      movie_comment GET    /movies/:movie_id/comments/:id(.:format)      comments#show
#                    PATCH  /movies/:movie_id/comments/:id(.:format)      comments#update
#                    PUT    /movies/:movie_id/comments/:id(.:format)      comments#update
#                    DELETE /movies/:movie_id/comments/:id(.:format)      comments#destroy
#             movies GET    /movies(.:format)                             movies#index
#                    POST   /movies(.:format)                             movies#create
#          new_movie GET    /movies/new(.:format)                         movies#new
#         edit_movie GET    /movies/:id/edit(.:format)                    movies#edit
#              movie GET    /movies/:id(.:format)                         movies#show
#                    PATCH  /movies/:id(.:format)                         movies#update
#                    PUT    /movies/:id(.:format)                         movies#update
#                    DELETE /movies/:id(.:format)                         movies#destroy
#     actor_comments GET    /actors/:actor_id/comments(.:format)          comments#index
#                    POST   /actors/:actor_id/comments(.:format)          comments#create
#  new_actor_comment GET    /actors/:actor_id/comments/new(.:format)      comments#new
# edit_actor_comment GET    /actors/:actor_id/comments/:id/edit(.:format) comments#edit
#      actor_comment GET    /actors/:actor_id/comments/:id(.:format)      comments#show
#                    PATCH  /actors/:actor_id/comments/:id(.:format)      comments#update
#                    PUT    /actors/:actor_id/comments/:id(.:format)      comments#update
#                    DELETE /actors/:actor_id/comments/:id(.:format)      comments#destroy
#             actors GET    /actors(.:format)                             actors#index
#                    POST   /actors(.:format)                             actors#create
#          new_actor GET    /actors/new(.:format)                         actors#new
#         edit_actor GET    /actors/:id/edit(.:format)                    actors#edit
#              actor GET    /actors/:id(.:format)                         actors#show
#                    PATCH  /actors/:id(.:format)                         actors#update
#                    PUT    /actors/:id(.:format)                         actors#update
#                    DELETE /actors/:id(.:format)                         actors#destroy
#          add_actor POST   /movies/:id/actors/new(.:format)              movies#add_actor
#       remove_actor DELETE /movies/:id/actors/:actor_id(.:format)        movies#remove_actor
#          add_movie POST   /actors/:id/movies/new(.:format)              actors#add_movie
#       remove_movie DELETE /actors/:id/movies/:movie_id(.:format)        actors#remove_movie











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
