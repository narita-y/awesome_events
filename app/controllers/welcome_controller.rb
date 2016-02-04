class WelcomeController < ApplicationController
  PER = 10

  def index

    @q = Event.page( params[:page] ).per(PER).order(:start_time).search( search_params )

    #@events = Event.where('start_time > ?', Time.zone.now).order(:start_time)
    #@events = Event.page( params[:page] ).per( PER ).where( 'start_time > ?', Time.zone.now ).order( :start_time )
    @events = @q.result( distinct: true )
  end

  private

  def search_params
    params.require(:q).permit!
  rescue
    { start_time_gteq: Time.zone.now }
  end
end
