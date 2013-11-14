class  Api::Callink::EventsController < ApplicationController
    def search
        @events = Event.reverse_chronological_order.all
        if params[:category].present?
            @events = Event.find_by_category(*params[:category].split(','))
        end
        if params[:club].present?
            @events = Event.find_by_club(*params[:club].split(','))
        end
        render :json => { :events => @events}
    end
end
