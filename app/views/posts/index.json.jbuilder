json.array!(@posts) do |post|
  json.extract! post, :posted_at, :body, :published
  json.url post_url(post, format: :json)
end