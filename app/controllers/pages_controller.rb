class PagesController < ApplicationController
  before_action :authenticate_user!, :except => [:landing, :help, :terms]


  def landing
  	@bottom = true 
  	
  end
  def dashboard
  	@users = User.all
    @rentals = current_user.rentals.order('created_at desc')
  end
  def help
  	@bottom = true 
  end
  def terms 
  	@skip_header = true
  end

  def applicant_dashboard
  
   @apps = current_user.requests.order('created_at desc')
  end

end
