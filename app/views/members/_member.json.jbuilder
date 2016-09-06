json.extract! member, :id, :email, :name, :password, :created_at, :updated_at
json.url member_url(member, format: :json)