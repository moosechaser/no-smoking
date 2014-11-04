FactoryGirl.define do
  factory :venue do
    sequence :name do |n|
      "venue_#{n}"
    end
    latitude "MyString"
    longitude "MyString"
    link "MyString"
    address "MyString"
    venue_type 1
    smoking_policy 1
  end
end
