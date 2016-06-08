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
  if resource.type == "Owner"
  '/complete-profile'
  elsif resource.type == "Tenant"
  '/'
  elsif resource.type == "Applicant"
  '/dashboard'
  elsif resource.type == "Admin"
  '/'
  end
  end

  def after_update_path_for(resource)
    '/dashboard'
  end

   def update_resource(resource, params)
    resource.update_without_password(params)
  end




end