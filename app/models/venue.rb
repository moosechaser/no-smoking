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

  @@venue_type_hash = {
    BLANK => "--",
    RESTAURANT => "Restaurant",
    COFFEE_SHOP => "Coffee Shop",
    PASTRY_SHOP => "Pastry Shop"
  }

  @@smoking_policy_hash = {
    BLANK => "--",
    ALL_NON_SMOKING => "Entire venue is non-smoking",
    NON_SMOKING_AREA => "Venue has a non-smoking section",
    OTHER => "Other",
  }


  def readable_venue_type
    result = @@venue_type_hash[self.venue_type ? self.venue_type : BLANK]
    return result
  end

  def readable_smoking_policy
    return @@smoking_policy_hash[self.smoking_policy ? self.smoking_policy : BLANK]
  end

  def all_venue_types
    result = [
      [@@venue_type_hash[BLANK], BLANK],
      [@@venue_type_hash[RESTAURANT], RESTAURANT],
      [@@venue_type_hash[COFFEE_SHOP], COFFEE_SHOP],
      [@@venue_type_hash[PASTRY_SHOP], PASTRY_SHOP]
    ]
    return result
  end

  def all_smoking_policies
    return [ 
      [@@smoking_policy_hash[BLANK], BLANK],
      [@@smoking_policy_hash[ALL_NON_SMOKING], ALL_NON_SMOKING],
      [@@smoking_policy_hash[NON_SMOKING_AREA], NON_SMOKING_AREA],
      [@@smoking_policy_hash[OTHER], OTHER]
    ]
  end
end
