json.array!(@models) do |model|
  json.extract! model, :id, :Artwork, :name, :content_type, :collection
  json.url model_url(model, format: :json)
end
