class FeedbackPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def initialize
    @page_path = contact_path

    @email_input = "#email"
    @body_input = "#body"
    @submit_button = "#submit"
  end

  #routing
  def visit_page
    visit @page_path
  end

  def visit_page_as(user)
    login_as(user)
    visit @page_path
  end


  #inputs
  def fill_email_input_with(email)
    find(@email_input).set email
  end

  def fill_body_input_with(email)
    find(@body_input).set email
  end

  def click_submit_button
    page.find(@submit_button).click
  end

  def submit_junk_feedback
    visit_page

    fill_email_input_with "asdf@asdf.com"
    fill_body_input_with "Hurray, this is feedback!"
    click_submit_button
  end
end
