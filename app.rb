require 'twitter'

settings = YAML::load(File.read('credentials.yml'))

Twitter.configure do |config|
	config.consumer_key = settings['consumer_key']
	config.consumer_secret = settings['consumer_secret']
	config.oauth_token = settings['oauth_token']
	config.oauth_token_secret = settings['oauth_token_secret']
end

latest_received_dm = Twitter.direct_messages(:count => 100).find{|x| x.sender_screen_name == settings['username']}
unless latest_received_dm.text == "STOP"
	Twitter.direct_message_create(settings['username'], "Are you feeling joy, trust, fear, surprise, sadness, disgust, anger, or anticipation? What have you done the last 15 minutes?")
end