require "spec_helper"

describe "venues#index" do
  let!(:ui) { VenueIndexPage.new( venues_path ) }

  before do
    ui.visit_page
  end

  it "should have the right title" do
    expect(page.title.downcase).to match /all/
  end
end
