json.array!(@requests) do |request|
  json.extract! request, :id, :salary, :occupation, :smoker, :petowner
  json.url request_url(request, format: :json)
end
