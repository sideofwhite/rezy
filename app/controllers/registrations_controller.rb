class RegistrationsController < Devise::RegistrationsController


def new 
       @skip_header = true
  super
end

def complete_profile

  
  if current_user.type == "Applicant"
  @applicant = current_user
  end

  if @applicant 
    render :complete_profile
  else
    redirect_to root_path
  end 

end


def update 



  if URI(request.referer).path == '/complete-profile'
    redirect_to root_path
  else 
    redirect_to '/dashboard', notice: "Updates Saved" 
  end



end






protected

  def after_sign_up_path_for(resource)
  sign_in(resource)
  if resource.type == "Owner"
  '/dashboard'
  elsif resource.type == "Tenant"
  '/t/dashboard'
  elsif resource.type == "Applicant"
  'a/dashboard'
  elsif resource.type == "Admin"
  '/admin/dashboard'
  end
  end

  def after_update_path_for(resource)
    '/dashboard'
  end

   def update_resource(resource, params)
    resource.update_without_password(params)
  end




end