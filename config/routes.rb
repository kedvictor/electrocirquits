Rails.application.routes.draw do
  
  

  root 'static_pages#index'
  get 'static_pages/index'
  get '/backend' => 'statistics#index'
  get '/backend/balls/:examination_id' => 'balls#index', :as => 'balls'
  get '/backend/balls/edit_ball/:examination_id/:student_id' => 'balls#edit_ball', :as => 'edit_ball'
  get '/backend/balls/update_ball/:examination_id/:student_id' => 'balls#update_ball', :as => 'update_ball'
  get '/backend/balls/view_ball/:examination_id/:student_id' => 'balls#view_ball', :as => 'view_ball'
  
  get '/backend/preview' => 'static_pages#preview', :as => 'preview'
  get '/backend/generate_page' => 'static_pages#generate_page', :as => 'generate_page'
  
  get '/statistics/index' => 'statistics#index', :as => 'statistics'

  scope 'backend' do
    resources :specialities
    resources :groups
    resources :students
    resources :examinations
  end
  
  
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
