require 'twitter'
require 'dotenv'
require 'pry'

class TownhallsFollowers

Dotenv.load '../../.env'

  def initialize #On définit nos API
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
    file = File.read('../../db/emails.json')
    @mix = JSON.parse(file)
    @mix.keys.each do |k| #Pour chaque ville on scrapp les id user qui correspondent à mairie 'ville'
      unless @client.user_search("mairie #{k}").first.nil? == true
      temp = @client.user_search("mairie #{k}").first
      @user_id.push(temp.screen_name) #On les push dans notre array au format @handle
    end
  end
  follow_handle
end

  def follow_handle #Methode qui follow tous nos comptes twitter des mairies
    @user_id.each do |i|
    @client.follow("#{i}")
    end
  end
end
