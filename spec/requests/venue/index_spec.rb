require "spec_helper"

describe "venues#index" do
  let!(:ui) { VenueIndexPage.new }

  before do
    ui.visit_page
  end

  it "should have the right title" do
    expect(page.title.downcase).to match /all/
  end


  it "should have a link to the about us page" do
    expect(ui).to have_about_us_link
  end


  it "should have a link to the about us page" do
    expect(ui).to have_contact_link
  end


  context "when there are two venues" do
    let!(:venue_1) { FactoryGirl.create(:venue) }
    let!(:venue_2) { FactoryGirl.create(:venue) }

    before { ui.visit_page }

    it { expect(page).to have_content venue_1.name }
    it { expect(page).to have_content venue_2.name }
  end

  describe "the details of a venue" do
    let!(:venue) { 
      FactoryGirl.create(:venue, 
                         venue_type:      Venue::RESTAURANT,
                         smoking_policy:  Venue::ALL_NON_SMOKING) }
    before { ui.visit_page }


    it { expect(ui).to have_show_link_for venue }
    it { expect(ui).to have_url_for venue }
    it "should have the venue's type" do
      expect(page).to have_css(
        ui.venues_list, text: venue.readable_venue_type)
    end

    it { expect(ui).not_to have_edit_button_for venue }
    it { expect(ui).not_to have_destroy_button_for venue }
  end
end
