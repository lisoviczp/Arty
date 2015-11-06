json.array!(@users) do |user|
  json.extract! user, :id, :name, :content_type, :collection_boolean, :description
  json.url user_url(user, format: :json)
end
