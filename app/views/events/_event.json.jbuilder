json.extract! event, :id, :nome, :latitude, :longitude, :tipo, :data_inicio, :data_fim, :app_user_id, :created_at, :updated_at
json.url event_url(event, format: :json)