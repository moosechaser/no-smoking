require "spec_helper"

describe AdminMailer do
  describe "AdminMailer#new_venue_email" do
    let!(:venue) { FactoryGirl.create(:venue) }
    let!(:maker_email) { "asdf@asdf.com" }
    let!(:mail) { AdminMailer.new_venue_email(maker_email, venue.name,
                                              venue.latitude,
                                              venue.longitude, venue.link,
                                              venue.address,
                                              venue.venue_type,
                                              venue.smoking_policy) }

    it "has the right recipient" do
      expect(mail.to)
        .to eq ["thomas.imorris@gmail.com"]
    end
    
    it "has the email in the body" do
      expect(mail.body.encoded)
        .to have_css "#email", text: maker_email
    end
    
    it "has the name in the body" do
      expect(mail.body.encoded)
        .to have_css "#name", text: venue.name
    end
    
    it "has the latitude in the body" do
      expect(mail.body.encoded)
        .to have_css "#latitude", text: venue.latitude
    end
    
    it "has the longitude in the body" do
      expect(mail.body.encoded)
        .to have_css "#longitude", text: venue.longitude
    end
    
    it "has the link in the body" do
      expect(mail.body.encoded)
        .to have_css "#link", text: venue.link
    end
    
    it "has the address in the body" do
      expect(mail.body.encoded)
        .to have_css "#address", text: venue.address
    end
    
    it "has the venue type in the body" do
      expect(mail.body.encoded)
        .to have_css "#venue_type", text: venue.venue_type
    end
    
    it "has the smoking policy in the body" do
      expect(mail.body.encoded)
        .to have_css "#smoking_policy", text: venue.smoking_policy
    end
  end
end
