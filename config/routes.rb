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
  resources :company_contacts
  resources :users

  resources :companies do
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

end
