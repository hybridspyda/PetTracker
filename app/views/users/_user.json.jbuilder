json.extract! user, :id, :first_name, :last_name, :username, :email, :password, :password_confirmation, :created_at, :updated_at
json.url user_url(user, format: :json)
