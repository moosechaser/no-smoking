require 'rails_helper'

RSpec.describe "venues/index", :type => :view do
  before(:each) do
    assign(:venues, [
      Venue.create!(
        :name => "Name",
        :latitude => "Latitude",
        :longitude => "Longitude",
        :link => "Link",
        :address => "Address",
        :venue_type => 1,
        :smoking_policy => 2
      ),
      Venue.create!(
        :name => "Name",
        :latitude => "Latitude",
        :longitude => "Longitude",
        :link => "Link",
        :address => "Address",
        :venue_type => 1,
        :smoking_policy => 2
      )
    ])
  end

  it "renders a list of venues" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Latitude".to_s, :count => 2
    assert_select "tr>td", :text => "Longitude".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
