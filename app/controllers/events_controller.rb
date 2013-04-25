class EventsController < ApplicationController
  
  def index
    @events = Event.all
  end
  
  def create
    user = current_user
    event = Event.find(params[:event_id])
    user.events << event
    if user.save
      redirect_to :back,:notice => "Appointment created"
    else
      redirect_to :back,:notice => "Please try again"
    end
  end
  
  def destroy
    user = current_user
    event = Event.find(params[:id])
    user.events.delete(event)
    
    respond_to do |format|
      format.html { redirect_to :back,:notice => "Appointment destroyed" }
    end
  end
  
end


