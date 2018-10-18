require 'twitter'
require 'dotenv'
require 'pry'

class Townhalls_Followers

Dotenv.load '../../.env'

def initialize
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_API_KEY"]
    config.consumer_secret     = ENV["TWITTER_API_SECRET_KEY"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_SECRET_TOKEN"]
  end
end
