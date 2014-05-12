class EventsController < ApplicationController

  helper_method :cities_with_events
  
  def index
    @events = params[:city_id].present? ? Event.where(:city_id => params[:city_id]) : Event.order('date DESC')
    @events_by_date = @events.group_by(&:date)
    @date = params[:date].blank? ? Date.today : Date.parse(params[:date])

    @articles = Article.order('created_at DESC').limit(3)
    @widget_events = Event.order('created_at DESC').limit(2)
    @cities = cities_with_events
    
    respond_to do |format|
      format.html
      format.js
    end
    
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
  
  def show
    @event = Event.find(params[:id])
    @articles = Article.order("created_at DESC").limit(3)
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def cities_with_events
    @_cities_with_events = City.order('cities.title ASC').with_events
  end
  
end


