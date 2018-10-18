
require 'google/apis/gmail_v1'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'
require 'gmail' 
require 'dotenv'
require 'json'
Dotenv.load"../.env"

PRENOM = "Nat"

class TownhallsMailer

	attr_accessor :gmail, :city, :automat, :email, :mails, :database, :testo, :data_hash

	def initialize 

		database = File.read"emails.JSON"
		data_hash = JSON.parse(database)
		@city = city
		@gmail = gmail
		@email = email
		@mails = mails
		@database = database
		@data_hash = data_hash
		gmail_connect
		automat
  end
  
  def gmail_connect
    @gmail = Gmail.connect(ENV["user_id"],ENV["user_pass"])    
  end

  def automat 
    x = 0
    while x < data_hash.values.length
    	townhall = data_hash.values[x]
      city = data_hash.keys[x].capitalize 
      @email = @gmail.compose do
    	to "#{townhall}"
    	subject "The Hacking Project"
    	body "Bonjour, Je m'appelle #{PRENOM}, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de notre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.
Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de #{city} veut changer le monde avec nous ?
Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"
 			x += 1
			end
		  @email.deliver!
	  end
  end
end
  

test = TownhallsMailer.new
