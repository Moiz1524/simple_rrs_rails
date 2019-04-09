class RoutesController < ApplicationController
    
    before_action :authenticate_admin!
    
    def index
        @routes = Route.all
    end
    
    def new
        @route = Route.new
    end
    
    def create
        @route = Route.new(route_params)
        if @route.save
            redirect_to(routes_path)
        else
            render('new')
        end
    end
    
    def edit
        @route = Route.find(params[:id])
    end
    
    def update
        @route = Route.find(params[:id])
        if @route.update_attributes(route_params)
            redirect_to(routes_path)
        else
            render('edit')
        end
    end
    
    def show
        @route = Route.find(params[:id])
    end
    
    def delete
        @route = Route.find(params[:id])
    end
    
    def destroy
        @route = Route.find(params[:id])
        @route.destroy
        redirect_to(routes_path)
    end
    
    def route_params
        params.require(:route).permit(:source_id, :dest_id, :fare)
    end
end
