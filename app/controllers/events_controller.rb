class EventsController < ApplicationController
	@event = Event.all
end

def create
	@event = Event.new(params[:event])
	@event.save

	redirect_to :action => :index
end

def show
	@event = Event.find(params[:id])
end

def edit
	@event + Event.find(params[:id])
end

def update
  @event = Event.find(params[:id])
  @event.update_attributes(event_params)

  redirect_to :action => :show, :id => @event
end

def destroy
  @event = Event.find(params[:id])
  @event.destroy

  redirect_to :action => :index
end

private

def event_params
	params.require(:event).permit(:name, :description)
end
