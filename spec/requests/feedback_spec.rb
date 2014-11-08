require "spec_helper"

describe "static_pages#contact" do
  let!(:ui) { FeedbackPage.new }
  before { ui.visit_page }

  it { expect(page.title.downcase).to match /contact/ }


  it "sends an email when everything is filled out" do
    expect{ ui.submit_junk_feedback }.to change{email_count}.by(1)
  end


  it "should send an email with the user's address in it" do
    email = "asdf@asdf.com"

    ui.fill_email_input_with email
    ui.fill_body_input_with "this is the body"
    ui.click_submit_button

    expect(last_email.body.encoded).to include email
  end
end
