require "spec_helper"

describe "venues#new" do
  let!(:ui) { VenueNewPage.new() }
  
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

  it "should increase the number of venues in the database" do
    attrs = FactoryGirl.attributes_for(:venue)
    expect{
      ui.create_new_venue_with_attributes attrs, sender:"asdf@asdf.com"
    }.to change{Venue.all.count}.by(1)
  end

  it "should create a venue that is not public" do
    attrs = FactoryGirl.attributes_for(:venue)
    expect{
      ui.create_new_venue_with_attributes attrs, sender:"asdf@asdf.com"
    }.not_to change{Venue.where(is_public?: true).count}
  end

  describe "when the latLng is not set" do
    let(:attrs){ FactoryGirl.attributes_for(:venue, latitude:"", longitude:"") }
    let(:sender){ "asdf@asdf.com" }
    before do
      ui.create_new_venue_with_attributes attrs, sender: sender
    end

    it "should display a notice" do
      puts page.html
      expect(ui).to have_content("Please click the map")
    end

    it "should still have the filled in name " do
      expect(ui.name).to eq attrs[:name]
    end

    it "should still have the filled in link " do
      expect(ui.link).to eq attrs[:link]
    end

    it "should still have the filled in venue type " do
      expect(ui.venue_type).to eq attrs[:venue_type]
    end

    it "should still have the filled in smoking policy " do
      expect(ui.smoking_policy).to eq attrs[:smoking_policy]
    end

    it "should still have the filled in description " do
      expect(ui.description).to eq attrs[:description]
    end

    it "should still have the filled in email" do
      expect(ui.email).to eq sender
    end
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
