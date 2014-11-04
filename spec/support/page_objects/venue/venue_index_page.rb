class VenueIndexPage
  include Capybara::DSL

  def initialize(path)
    @page_path = path
  end

  def visit_page
    visit @page_path
  end

  def visit_page_as(user)
    login_as(user)
    visit @page_path
  end
end
