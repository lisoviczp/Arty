json.array!(@messages) do |message|
  json.extract! message, :id, :comment, :due_date, :price, :artist_id, :user_id, :accepted
  json.url message_url(message, format: :json)
end
