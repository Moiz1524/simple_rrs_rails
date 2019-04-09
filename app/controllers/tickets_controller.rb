class TicketsController < ApplicationController
  
  before_action :authenticate_user!
  #before_action :authenticate_admin!, only: [:index, :edit, :update, :destroy, :show]
  
  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    @travel = Travel.find(ticket_params[:travel_id])
    if @travel.ava_seats > 0   
      if @ticket.save
        @travel.ava_seats = @travel.ava_seats - 1
        @travel.save
        #decrement(@ticket.travel.ava_seats, by = 1)
        #@ticket.travel.ava_seats = @ticket.travel.ava_seats - 1
        redirect_to(ticket_path(@ticket))
        flash[:notice] = "Your ticket has been created successfully!."
      else
        render('new')
      end
    else
      redirect_to(new_ticket_path)
      flash[:notice] = "There are no available seats for this travel!."
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update_attributes(ticket_params)
      redirect_to(tickets_path)
      flash[:notice] = "Your ticket has been updated successfully!."
    else
      render('edit')
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
    @travel = @ticket.travel
  end

  def destroy 
    @ticket = Ticket.find(params[:id])
    @travel = Travel.find(@ticket.travel.id)
    if @ticket.destroy 
      @travel.ava_seats = @travel.ava_seats + 1
      @travel.save
      redirect_to(tickets_path)
      flash[:notice] = "Your ticket has been deleted!."
    else
      
    end
    
  end
  
  private
  
  def ticket_params
    params.require(:ticket).permit(:price, :travel_id, :user_id)
  end
end
