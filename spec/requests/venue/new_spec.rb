require "spec_helper"

describe "venues#new" do
  let!(:venue) { FactoryGirl.create(:venue) }
  let!(:ui) { VenueNewPage.new(venue) }
  
  context "when not logged in" do
    it "should give an error"
  end

  context "when logged in as an admin" do
    before { ui.visit_page }
    # before { ui.visit_page_as(admin) }


    it "should have the right title" do
      expect(page.title.downcase).to match /edit/
    end


    it "should submit an email when the submit button is pressed" do
      attrs = FactoryGirl.attributes_for(:venue)

      save_and_open_page
      expect{ ui.create_new_venue_with_attributes( attrs ) }
        .to change{ ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
