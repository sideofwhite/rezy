json.array!(@contacts) do |contact|
  json.extract! contact, :id, :firstName, :lastName, :email
  json.url contact_url(contact, format: :json)
end
