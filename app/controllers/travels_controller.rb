class TravelsController < ApplicationController
    
    before_action :authenticate_admin!
    
    def index
       @travels = Travel.all 
    end
    
    def new
        @travel = Travel.new
    end
    
    def create
        @travel = Travel.new(travel_params)
        @travel.total_seats = Train.find(travel_params[:train_id]).t_capacity
        @travel.ava_seats = @travel.total_seats
        if @travel.save
            redirect_to(travels_path)
            flash[:notice] = "Travel created successfully!."
        else
            render('new')
        end
    end
    
    def edit
        @travel = Travel.find(params[:id])
    end
    
    def update
        @travel = Travel.find(params[:id])
        if @travel.update_attributes
            redirect_to(travels_path)
            flash[:notice] = "Travel updated successfully!."
        else
            render('edit')
        end
    end
     
    def show
        @travel = Travel.find(params[:id])
        @tickets = @travel.tickets
        @t_count = @tickets.count
    end
    
    def destroy
        @travel = Travel.find(params[:id])
        @travel.destroy
        redirect_to(travels_path)
        flash[:notice] = "Travel deleted successfully!."
    end
    
    private
    
    def travel_params
        params.require(:travel).permit(:train_id, :route_id, :total_seats, :ava_seats)
    end
end
