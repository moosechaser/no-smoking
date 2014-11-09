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
    @description_input =            "#venue_description"

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

  def name
    find(@name_input).value
  end

  def latitude
    find(@latitude_input).value
  end

  def longitude
    find(@longitude_input).value
  end

  def link
    find(@link_input).value
  end

  def venue_type
    find(@venue_type_input).value.to_i
  end

  def smoking_policy
    find(@venue_smoking_policy_input).value.to_i
  end

  def description
    find(@description_input).value
  end

  def email
    find(@email_input).value
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
    find( @description_input ).set attrs[:description]

    page.find(@submit_button).click
  end
  
  def select_venue_type(type)
    find("#{@venue_type_input} option[value='#{type}']").select_option
  end

  def select_smoking_policy(policy)
    find("#{@venue_smoking_policy_input} option[value='#{policy}']").select_option
  end
end
