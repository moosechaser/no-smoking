class Venue < ActiveRecord::Base
  #venue_type constants
  RESTAURANT = 1
  COFFEE_SHOP = 2
  PASTRY_SHOP = 3

  #smoking_policy constants
  ALL_NON_SMOKING = 1
  NON_SMOKING_AREA = 2

  def readable_venue_type
    hash = {
      RESTAURANT => "Restaurant",
      COFFEE_SHOP => "Coffee Shop",
      PASTRY_SHOP => "Pastry Shop"
    }

    return hash[self.venue_type]
  end
end
