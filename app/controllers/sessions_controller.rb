class SessionsController < Devise::SessionsController
    
    def new
     @skip_header = true
    super
    end


end