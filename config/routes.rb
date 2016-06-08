Rails.application.routes.draw do
  


  
  

  
  resources :rentals do
  	resources :issues
  	resources :requests
    resources :galleries
  end
  
 

  devise_for :users, :controllers => { :sessions => 'sessions' }, :skip => :registrations
  devise_for :owners, :applicants, :skip => :sessions, controllers: {registrations: :registrations}
  devise_for :tenants, :admin, :skip => :sessions, :skip => :registrations

  devise_scope :applicant do
 
  get "/complete-profile" => "registrations#complete_profile"
end

 devise_scope :owner do
 get "/owners/get-started" => "registrations#new"
 end

 devise_scope :user do 
 get "/login" => "sessions#new", as: :login
 end

  root to: 'pages#landing'
  # owners
  get '/dashboard', to: 'pages#dashboard'
  get '/dashboard/rentals', to: 'rentals#index'
  #applicants
  get '/a/dashboard', to: 'pages#applicant_dashboard'
  #tenants

  #admin

  #public
  get'/rentals/:id/listing', to: 'rentals#listing'
  #misc
  get '/terms', to: 'pages#terms'
  get '/help', to: 'pages#help'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
