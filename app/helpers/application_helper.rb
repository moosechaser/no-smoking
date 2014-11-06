module ApplicationHelper

  def venues_page?
    current_page?(:controller => 'venues', :action => 'index')
  end

end
