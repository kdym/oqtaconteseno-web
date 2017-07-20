module FacebookHelper
  def self.get_user_by_id id
    HTTParty.get "#{FacebookParameters.graph_api_url}/#{id}?access_token=#{FacebookParameters.access_token}&fields=picture,name"
  end
end