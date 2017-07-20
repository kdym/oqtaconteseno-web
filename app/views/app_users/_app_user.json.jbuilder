json.extract! app_user, :id, :facebook_id, :created_at, :updated_at
json.url app_user_url(app_user, format: :json)