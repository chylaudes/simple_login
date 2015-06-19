Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['twitter_key'], ENV['twitter_secret']
    provider :facebook, 'APP_ID', 'APP_SECRET'
end