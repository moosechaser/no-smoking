require 'spec_helper'

describe Venue do
  let!(:venue) { FactoryGirl.create(:venue) }

  describe "Venue#readable_venue_type" do
    it "should work when venue is a restaurant" do
      venue.venue_type = Venue::RESTAURANT

      expect(venue.readable_venue_type).to eq "Restaurant"
    end

    it "should work when venue is a coffee shop" do
      venue.venue_type = Venue::COFFEE_SHOP

      expect(venue.readable_venue_type).to eq "Coffee Shop"
    end

    it "should work when venue is a pastry shop" do
      venue.venue_type = Venue::PASTRY_SHOP

      expect(venue.readable_venue_type).to eq "Pastry Shop"
    end
  end
end
