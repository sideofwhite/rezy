json.array!(@rentals) do |rental|
  json.extract! rental, :id, :address, :addressSecondary, :city, :postal, :province
  json.url rental_url(rental, format: :json)
end
