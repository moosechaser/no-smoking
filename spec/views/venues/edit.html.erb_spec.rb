require 'rails_helper'

RSpec.describe "venues/edit", :type => :view do
  before(:each) do
    @venue = assign(:venue, Venue.create!(
      :name => "MyString",
      :latitude => "MyString",
      :longitude => "MyString",
      :link => "MyString",
      :address => "MyString",
      :venue_type => 1,
      :smoking_policy => 1
    ))
  end

  it "renders the edit venue form" do
    render

    assert_select "form[action=?][method=?]", venue_path(@venue), "post" do

      assert_select "input#venue_name[name=?]", "venue[name]"

      assert_select "input#venue_latitude[name=?]", "venue[latitude]"

      assert_select "input#venue_longitude[name=?]", "venue[longitude]"

      assert_select "input#venue_link[name=?]", "venue[link]"

      assert_select "input#venue_address[name=?]", "venue[address]"

      assert_select "input#venue_venue_type[name=?]", "venue[venue_type]"

      assert_select "input#venue_smoking_policy[name=?]", "venue[smoking_policy]"
    end
  end
end
