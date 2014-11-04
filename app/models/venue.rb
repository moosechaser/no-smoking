class Venue < ActiveRecord::Base
  #venue_type constants
  RESTAURANT = 1
  COFFEE_SHOP = 2
  PASTRY_SHOP = 3

  #smoking_policy constants
  All_NON_SMOKING = 1
  NON_SMOKING_AREA = 2
end
