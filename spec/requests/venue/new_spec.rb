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


  describe "the email sent" do
    let!(:sender) { "asdf@asdf.com" }
    let!(:attrs) { FactoryGirl.attributes_for(:venue) }

    before do
      ui.create_new_venue_with_attributes attrs, sender: sender
    end

    it "should have the proper user email address" do
      expect(ActionMailer::Base.deliveries.last.body.encoded)
        .to include sender
    end

    it "should have the proper smoking policy" do
      expect(ActionMailer::Base.deliveries.last.body.encoded)
        .to include attrs[:smoking_policy].to_s
    end
  end
end
