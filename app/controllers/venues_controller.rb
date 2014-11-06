class VenuesController < ApplicationController
  include ApplicationHelper
  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

  def index
    @venues = Venue.all
    respond_with(@venues)
  end

  def show
    respond_with(@venue)
  end

  def new
    @venue = Venue.new
    respond_with(@venue)
  end

  def edit
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.save
    respond_with(@venue)
  end

  def update
    @venue.update(venue_params)
    respond_with(@venue)
  end

  def destroy
    @venue.destroy
    respond_with(@venue)
  end

  private
    def set_venue
      @venue = Venue.find(params[:id])
    end

    def venue_params
      params.require(:venue).permit(:name, :latitude, :longitude, :link, :address, :venue_type, :smoking_policy)
    end
end
