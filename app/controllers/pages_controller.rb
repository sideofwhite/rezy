class PagesController < ApplicationController
  def landing
  	@bottom = true 
  	@skip_header = true
  end
  def dashboard
    @dashboard = true
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
  end

end
