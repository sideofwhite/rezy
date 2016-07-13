Rails.application.routes.draw do
  


  
  

  
  
  resources :contacts
  resources :rentals do
  	resources :issues
  	resources :requests
    resources :galleries
    resources :features
  end
  
 

  devise_for :users, :controllers => { :sessions => 'sessions' }, :skip => :registrations
  devise_for :owners, :applicants, :skip => :sessions, controllers: {registrations: :registrations}
  devise_for :tenants, :admin, :skip => [:sessions, :registrations]

  devise_scope :applicant do
  get "apply/get-started" => "registrations#new", as: :apply_start
end

 devise_scope :owner do
 get "/owners/get-started" => "registrations#new"
 get "/owners/info" => "registrations#edit", as: :owner_info, :onboard => "true"
 get "/complete-profile" => "registrations#complete_profile"
 end

 devise_scope :user do 
 get "/login" => "sessions#new", as: :login
 end

  root to: 'pages#landing'
  # owners
  get '/dashboard', to: 'pages#dashboard'
  get '/dashboard/rentals', to: 'rentals#index'
  get '/manage/issues', to: 'rentals#issues', as: :issues
  get '/manage/applicants', to: 'rentals#applicants', as: :applicants
  get '/rentals/:id/add-unit', to: 'rentals#add_unit', as: :add_unit
  get '/owners/hey-hi-hello', to: 'pages#hello', as: :hello
  #applicants
  get '/a/dashboard', to: 'pages#applicant_dashboard', as: :applicant_dashboard
  #tenants

  #admin

  #public
  get'/rentals/:id/listing', to: 'rentals#listing'
  #misc
  get '/terms', to: 'pages#terms'
  get '/help', to: 'pages#help'
  get '/pricing', to: 'pages#pricing'
  get '/landlord-resources', to: 'pages#resources', as: :resources
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
