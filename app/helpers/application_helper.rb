module ApplicationHelper

  def venues_page?
    current_page?(:controller => 'venues', :action => 'index')
  end

  def new_venue_page?
    current_page?(:controller => 'venues', :action => 'new')
  end

end
