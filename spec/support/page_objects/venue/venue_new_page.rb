class VenueNewPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def initialize(venue)
    @page_path = new_venue_path

    @email_input =                  "#email"
    @name_input =                   "#venue_name"
    @latitude_input =               "#input-lat"
    @longitude_input =              "#input-lng"
    @link_input =                   "#venue_link"
    #@address_input =                "#address"
    @venue_type_input =             "#venue_venue_type"
    @venue_smoking_policy_input =   "#venue_smoking_policy"

    @submit_button =                "#submit"
  end

  #routing
  def visit_page
    visit @page_path
  end

  def visit_page_as(user)
    login_as(user)
    visit @page_path
  end

  def create_new_venue_with_attributes( attrs, options = {} )
    find( @email_input ).set options[:sender]

    find( @name_input ).set attrs[:name]
    find( @link_input ).set attrs[:link]
    #find( @address_input ).set attrs[:address]
    find( @latitude_input ).set attrs[:latitude]
    find( @longitude_input ).set attrs[:longitude]
    select_venue_type attrs[:venue_type]
    select_smoking_policy attrs[:smoking_policy]

    page.find(@submit_button).click
  end
  
  def select_venue_type(type)
    find("#{@venue_type_input} option[value='#{type}']").click
  end

  def select_smoking_policy(policy)
    find("#{@venue_smoking_policy_input} option[value='#{policy}']").click
  end
end
