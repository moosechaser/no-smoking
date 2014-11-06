class Venue < ActiveRecord::Base
  #venue_type constants
  OTHER       = -1
  BLANK       = 0
  RESTAURANT  = 1
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

  def all_venue_types
    return [ 
      ["--", BLANK],
      ["Restaurant", RESTAURANT],
      ["Coffee Shop", COFFEE_SHOP],
      ["Pastry Shop", PASTRY_SHOP]
    ]
  end

  def all_smoking_policies
    return [ 
      ["Entire restaurant is non-smoking", ALL_NON_SMOKING],
      ["Restaurant has a non-smoking section", NON_SMOKING_AREA],
      ["Other", OTHER]
    ]
  end
end
