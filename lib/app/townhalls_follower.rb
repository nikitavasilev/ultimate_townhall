require 'twitter'
require 'dotenv'
require 'pry'

class TownhallsFollowers

Dotenv.load '../../.env'

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_API_KEY"]
      config.consumer_secret     = ENV["TWITTER_API_SECRET_KEY"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_SECRET_TOKEN"]
    end
    search_handle
  end

  def search_handle
    @user_id=[]
    file = File.read('../../db/emails.JSON')
    data_hash = JSON.parse(file)
    data_hash.keys.each do |k|
      unless @client.user_search("mairie #{k}").first.nil? == true
      temp = @client.user_search("mairie #{k}").first
      @user_id.push(temp.screen_name)
    end
  end
  p @user_id
  follow_handle
end

  def follow_handle
    @user_id.each do |i|
    @client.follow("#{i}")
    end
  end
end

TownhallsFollowers.new
