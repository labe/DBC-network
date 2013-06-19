Alumni::Application.routes.draw do

  resources :companies
  resources :sessions
  resources :students
  resources :employers
  resources :mentors
  resources :staffs
  resources :admins
  resources :interests
  resources :cohorts
  resources :administrations

  resources :users do
    resources :questions do
      resources :answers
    end
  end

  resources :answers

  root :to => 'homes#index'

  get   "log_out"            => "sessions#destroy"
  get   "log_in"             => "sessions#new"
  get   "sign_up"            => "users#new"
  get   "thank_you"          => "users#thankyou"
  get   "admin"              => "admins#index"
  get   "profile"            => "sessions#show"
  get   "results"            => "homes#results"
  get   "create_user"        => "admins#create_user"
  get   "connections"        => "users#connections"
  post  "create_student"     => "admins#create_student"
  post  "create_employer"    => "admins#create_employer"
  post  "create_company"     => "admins#create_company"
  post  "create_cohort"      => "admins#create_cohort"
  post  "log_in"             => "sessions#create"
  post  "user_activation"    => "admins#user_activation"
  post  "user_deny"          => "admins#user_deny"
  post  "company_activation" => "admins#company_activation"
  post  "company_deny"       => "admins#company_deny"
  post  "status"             => "users#status"
  post  "connect_students"   => "users#connect_students"
  post  "connect_employers"  => "users#connect_employers"
  post  '/users/:user_id/edit/github', to: "users#git_list", :as => "user_github"

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
