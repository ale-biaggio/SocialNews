json.extract! user, :id, :name, :surname, :username, :email, :password, :phone, :created_at, :updated_at
json.url user_url(user, format: :json)
