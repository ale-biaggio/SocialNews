json.extract! comment, :id, :body, :like, :created_at, :updated_at
json.url comment_url(comment, format: :json)
