class HomeController < ApplicationController
    
    before_action :authenticate_user!
    
    def index
       @tickets = Ticket.where(current_user.id) 
    end
end
