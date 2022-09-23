json.extract! post, :id, :title, :tag, :body, :image, :rank, :created_at, :updated_at
json.url post_url(post, format: :json)
