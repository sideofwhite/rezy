class PagesController < ApplicationController
  before_action :authenticate_user!, :except => [:landing, :help, :terms, :hello, :pricing, :resources]


  def landing
    @bottom = true 
  	
    @contact = Contact.new
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

  def resources
 @contact = Contact.new
  end

 def pricing
  @bottom = true 
   @contact = Contact.new
 end


  def hello
  @skip_header = true
  end

  def applicant_dashboard
  
   @apps = current_user.requests.order('created_at desc')
  end

end
