class FacebookParameters
  def self.access_token
    "#{self.app_id}|#{self.app_secret}"
  end

  def self.app_id
    '1222287161140806'
  end

  def self.app_secret
    'f6dc8eea0dc63ae8226596aaed1d1ac9'
  end

  def self.graph_api_url
    'https://graph.facebook.com'
  end
end