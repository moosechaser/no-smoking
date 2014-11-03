require 'rails_helper'

RSpec.describe "venues/show", :type => :view do
  before(:each) do
    @venue = assign(:venue, Venue.create!(
      :name => "Name",
      :latitude => "Latitude",
      :longitude => "Longitude",
      :link => "Link",
      :address => "Address",
      :venue_type => 1,
      :smoking_policy => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Latitude/)
    expect(rendered).to match(/Longitude/)
    expect(rendered).to match(/Link/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
