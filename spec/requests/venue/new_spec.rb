require "spec_helper"

describe "venues#new" do
  let!(:venue) { FactoryGirl.create(:venue) }
  let!(:ui) { VenueNewPage.new(venue) }
  
  before { ui.visit_page }

  it "should have the right title" do
    expect(page.title.downcase).to match /new/
  end


  it "should submit an email when the submit button is pressed" do
    attrs = FactoryGirl.attributes_for(:venue)

    expect{ 
      ui.create_new_venue_with_attributes attrs, sender: "asdf@asdf.com"
    }.to change{ ActionMailer::Base.deliveries.count }.by(1)
  end
end
