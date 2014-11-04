class VenueIndexPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def initialize
    @page_path = venues_path
  end

  def visit_page
    visit @page_path
  end

  def visit_page_as(user)
    login_as(user)
    visit @page_path
  end
end
