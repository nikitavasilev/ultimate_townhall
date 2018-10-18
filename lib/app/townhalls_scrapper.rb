require 'nokogiri'
require 'open-uri'
require 'rest-client'
require 'json'

#Les trois départements choisis : Alpes-Maritimes, Territoire de Belfort, Var

class TownhallsScrapper
  #creer cette partie pour les instances de classe
  include Enumerable
  attr_accessor :names, :email, :departement

  def initialize
    @departement = [] #on appelle nos arrays ici
    @names = []
    @email = []
  end

  def get_email(href)
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{href}"))
    @departement << page.css('tr.txt-primary.tr-last td')[27].text #on intègre nos liens dans les arrays
    @names << page.css('h1')[1].text
    @email << page.css('tr.txt-primary.tr-last td')[7].text

    rescue OpenURI::HTTPError => e
      if e.message == '404 Not Found'
      else
        raise e
      end
  end

  def get_url_am
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/alpes-maritimes.html"))
    link = page.css("a.lientxt")
    link.each {|link| get_email(link['href'].delete_prefix('.'))}
  end

  def get_url_belfort
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/territoire-de-belfort.html"))
    link = page.css("a.lientxt")
    link.each {|link| get_email(link['href'].delete_prefix('.'))}
  end

  def get_url_var
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/var.html"))
    link = page.css("a.lientxt")
    link.each {|link| get_email(link['href'].delete_prefix('.'))}
  end

end

scrap = TownhallsScrapper.new
puts "on lance get all url qui lance get all name et va recup les urls des communes"
scrap

#On scrappe depuis les méthodes
scrap.get_url_am
scrap.get_url_belfort
scrap.get_url_var

puts scrap.departement
puts scrap.names
puts scrap.email

#on zip les arrays
@mix = Hash[scrap.names.zip(scrap.email)]

#on insère dans le json
File.open('./../../db/emails.json', 'w') do |f|
  f.write(@mix.to_json )
end
