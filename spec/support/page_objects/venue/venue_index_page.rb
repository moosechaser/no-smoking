class VenueIndexPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def initialize
    @page_path = venues_path
  end

  #routing
  def visit_page
    visit @page_path
  end

  def visit_page_as(user)
    login_as(user)
    visit @page_path
  end


  #venue details
  def has_link_for?(venue)
    has_css? link_for(venue)
  end

  def has_address_for?(venue)
    has_css? venues_list, text: venue.address
  end



  def venues_list
    ".venues"
  end

  def link_for(venue)
    "#{venues_list} a[href='http://#{venue.link}'][target='_blank']"
  end

  def address_for(venue)
    "#{venues_list}"
  end
end
