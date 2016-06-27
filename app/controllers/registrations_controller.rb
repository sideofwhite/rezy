class RegistrationsController < Devise::RegistrationsController


def new 
       @skip_header = true
  super
end

def info
  if current_user.type == "Owner"
  @owner = current_user
  end

  if @owner
    render :complete_profile
  else
    redirect_to root_path
  end 
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
 if resource.type == "Applicant"
  if URI(request.referer).path == '/complete-profile'
    redirect_to root_path
  else
  '/a/dashboard'
  end
 end

  if  resource.type == "Owner"
  '/dashboard'
  end

super

end






protected


  def after_sign_up_path_for(resource)
  sign_in(resource)
   if session[:request].present?
   # save request
       @rental = Rental.find(session[:rental])
       @request = @rental.requests.build(session[:request]["request"])
       @request.user_id = current_user.id
      # clear session
      session[:request] = nil
      session[:rental] = nil

      if @request.save
        return rental_path(@rental)
      else 
        return rental_path(@rental)
      end
  end
  if resource.type == "Owner"
  '/completer0'
  elsif resource.type == "Tenant"
  '/t/dashboard'
  elsif resource.type == "Admin"
  '/admin/dashboard'
  end
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end



   




end