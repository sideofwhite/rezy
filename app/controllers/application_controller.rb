class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!, :authenticate_tenant!, :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_account, :current_account_type, :account_signed_in?

  

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
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstName, :lastName, :email, :password, :password_confirmation, :avatar, :type) }
  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:firstName, :lastName, :email, :password, :current_password, :password_confirmation, :avatar, :type) }
  end




end
