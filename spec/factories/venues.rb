FactoryGirl.define do
  factory :venue do
    sequence :name do |n|
      "Venue #{n}"
    end

    latitude        "1.234"
    longitude       "2.345"
    link            "www.google.com"
    address         "9999 Main St."
    venue_type      1
    smoking_policy  2
  end

end
