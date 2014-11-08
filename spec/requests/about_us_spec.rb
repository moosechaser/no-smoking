require "spec_helper"

describe "static_pages#about_us" do
  before { visit about_us_path }

  it { expect(page.title.downcase).to match /about us/ }

  it "should have a link to the contact page" do
    expect(page).to have_css "a[href='#{contact_path}']"
  end
end
