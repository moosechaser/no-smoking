class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  def index
    @venues = Venue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @venues.map{|v| {name: v.name, lat:v.latitude, lng: v.longitude }}.to_json }
    end
  end

  def show
  end

  def new
    @venue = Venue.new
  end

  def edit
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.save
  end

  def update
    @venue.update(venue_params)
  end

  def destroy
    @venue.destroy
  end

  private
    def set_venue
      @venue = Venue.find(params[:id])
    end

    def venue_params
      params.require(:venue).permit(:name, :latitude, :longitude, :link, :address, :venue_type, :smoking_policy)
    end
end
