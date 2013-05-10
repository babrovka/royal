class EventsController < ApplicationController
  
  def index
    @events = Event.all
  end
  
  def create
    user = current_user
    @event = Event.find(params[:event_id])
    user.events << @event
    
    respond_to do |format|
      if user.save
        format.html { redirect_to :back,:notice => "Appointment created" }
        format.js
      else
        format.html { redirect_to :back,:notice => "Please try again" }
      end
    end
    
  end
  
  def destroy
    user = current_user
    @event = Event.find(params[:id])
    user.events.delete(@event)
    
    respond_to do |format|
      format.html { redirect_to :back,:notice => "Appointment destroyed" }
      format.js
    end
  end
  
end


