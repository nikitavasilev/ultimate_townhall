
require 'google/apis/gmail_v1'                   # Ici, on fait simplement appel à toutes les gems nécessaires pour
require 'googleauth'                             # executer le programme
require 'googleauth/stores/file_token_store'
require 'fileutils'
require 'gmail' 
require 'dotenv'
require 'json'
Dotenv.load".env"

PRENOM = "Nat"                # on crée une constante ( qui par définition est invariable ) contenant mon prénom

class TownhallsMailer         # on crée une classe incluant toutes les méthodes permettant l'execution du programme

	attr_accessor :gmail, :city, :automat, :email, :mails, :database, :testo, :data_hash # on met en place un attr_accessor
                                                # qui regroupe toutes les variables d'instances qui seront nécessaires 
	def initialize   # on lance une def initialize qui integre les variables d'instances et surtout qui lance
		               # automatiquement 2 méthodes, la premiere permettant de se connecter au compte gmail et 
		               # la seconde permettant d'envoyer en masse des mails

		database = File.read"./db/emails.json"  # cette ligne de code permet d'accéder au contenu du fichier.JSON que l'on
		data_hash = JSON.parse(database)   # veut réutiliser / la variable data_hash lui permet de rentrer le contenu 
		@city = city                       # de nos data dans une variable qui pourra nous servir par la suite dans notre programme
		@gmail = gmail
		@email = email
		@mails = mails
		@database = database
		@data_hash = data_hash
		gmail_connect  
		automat 
  end  
  
  def gmail_connect      
    @gmail = Gmail.connect(ENV["user_id"],ENV["user_pass"]) # on crée notre méthode permettant la connexion au compte gmail    
  end   # pour cela on fait appel a dotenv pour masquer les parametres nécessaires à la connexion ( l'adresse mail + le pass)

  def automat     # cette méthode permet dans un premier temps de creer une boucle qui a pour vocation d'isoler chaque
    x = 0         # valeur (adresse mail) de notre variable data_hash pour pouvoir ensuite le reintegrer , via la variable
    while x < data_hash.values.length  # townhall , dans notre portion de code permettant l'envoi automatisé de mails
    	townhall = data_hash.values[x] # on procéde de la même manière avec nos clés ( nom des communes ) qui sera intégré
      city = data_hash.keys[x].capitalize  # dans une variable nommée city et que l'on pourra utiliser dans notre code
      @email = @gmail.compose do  # ici on lance le code permettant à l'API gmail d'envoyer automatiquement un mail 
    	to "#{townhall}" # grace a la fonction compose, ensuite on intégre dans le destinataire (to) la variable townhall       
    	subject "The Hacking Project" # afin de personnaliser a chaque envoi l'adresse mail du destinataire
    	body "Bonjour, Je m'appelle #{PRENOM}, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de notre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.
Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de #{city} veut changer le monde avec nous ?
Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"
 			x += 1 # de la même facon, la variable city permet de personnaliser le nom de la commune a laquelle on envoie le mail
			end  
		  @email.deliver! # le @email.deliver! permet de valider l'envoi du mail 
	  end
  end
end