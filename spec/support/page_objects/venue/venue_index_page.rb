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
  def has_url_for?(venue)
    has_css? url_for(venue)
  end

  def has_address_for?(venue)
    has_css? venues_list, text: venue.address
  end

  def has_edit_button_for?(venue)
    has_css? edit_button_for(venue)
  end

  def has_destroy_button_for?(venue)
    has_css? destroy_button_for(venue)
  end



  def venues_list
    ".venues"
  end

  def url_for(venue)
    "#{venues_list} a[href='http://#{venue.link}'][target='_blank']"
  end

  def address_for(venue)
    "#{venues_list}"
  end

  def edit_button_for(venue)
    "#{venues_list} a#edit_#{venue.id}"
  end

  def destroy_button_for(venue)
    "#{venues_list} a#destroy_#{venue.id}"
  end
end
