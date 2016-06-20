json.array!(@features) do |feature|
  json.extract! feature, :id, :bed, :bath, :rent, :available, :dishwasher, :washer_dryer, :hardwood, :deck, :air, :cat, :dog, :bbq, :title, :description, :new_kitchen, :neighbourhood, :rental_id, :year_lease
  json.url feature_url(feature, format: :json)
end
