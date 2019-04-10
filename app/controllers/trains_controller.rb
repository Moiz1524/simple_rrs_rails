class TrainsController < ApplicationController
    
    before_action :authenticate_admin!, except: [:index]
    
    def index
        @trains = Train.all
    end
    def new
        @train = Train.new        
    end
    def create
        @train = Train.new(train_params)
        @train.t_capacity = 0
        @train.compartments.each do |c|
           @train.t_capacity = @train.t_capacity + c.capacity 
        end
        if @train.save
            redirect_to(train_path(@train))
        else
            render 'new'
        end
    end
    def edit
        @train = Train.find(params[:id])
    end
    def update
        @train = Train.find(params[:id])
        if @train.update_attributes(train_params)
            @train.t_capacity = 0
            @train.compartments.each do |c|
                @train.t_capacity = @train.t_capacity + c.capacity
            end
            @train.save
            redirect_to(trains_path)
        else
            render 'edit'
        end 
    end
    def show
        @train = Train.find(params[:id])
    end
    def delete
        @train = Train.find(params[:id])
    end
    def destroy
        @train = Train.find(params[:id])
        @train.destroy
        redirect_to(trains_path)
    end
    
    def train_params
       params.require(:train).permit(:name, :avatar, :t_capacity, :compartment_ids => []) 
    end
end
