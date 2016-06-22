class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?



  protected
 

  def after_sign_in_path_for(resource)
  if resource.type == "Owner"
  '/dashboard'
  elsif resource.type == "Tenant"
  '/t/dashboard'
  elsif resource.type == "Applicant"
  '/a/dashboard'
  elsif resource.type == "Admin"
  '/admin/dashboard'
  end
  end




  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) do |user|
  user.permit(:firstName, :lastName, :email, :password, :password_confirmation, :avatar, :type) 
  end
  devise_parameter_sanitizer.permit(:account_update) do |user|
    user.permit(:firstName, :lastName, :email, :avatar) 
  end
  end



end
