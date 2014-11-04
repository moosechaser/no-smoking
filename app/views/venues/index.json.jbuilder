json.array!(@venues) do |venue|
  json.extract! venue, :id, :name, :latitude, :longitude, :link, :address, :venue_type, :smoking_policy
  json.url venue_url(venue, format: :json)
end
