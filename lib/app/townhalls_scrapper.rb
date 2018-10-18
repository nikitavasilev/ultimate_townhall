require 'nokogiri'
require 'open-uri'
require 'rest-client'

#Les trois départements choisis : Alpes-Maritimes, Territoire de Belfort, Var

class TownhallsScrapper

  def perform
    get_url_am("http://annuaire-des-mairies.com/alpes-maritimes.html")
    get_url_belfort('http://annuaire-des-mairies.com/territoire-de-belfort.html')
    get_url_var('http://annuaire-des-mairies.com/var.html')
  end

  def get_email(townurl)
    page = Nokogiri::HTML(open(townurl))
    name = page.xpath('/html/body/div/main/section[1]/div/div/div/h1')
    email = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
    departement = page.xpath("/html/body/div/main/section[4]/div/table/tbody/tr[1]/td[2]")

    array_name=[]
    name.each do |i|
    name1= i.text
    array_name << name1
    end

    array_mail=[]
    email.each do |i|
    email1 = i.text
    array_mail << email1
    end

    array_dpt=[]
    departement.each do |i|
    dpt= i.text
    array_dpt << dpt
    end

    hash = Hash[array_name.zip(array_mail)]
    hashi = Hash[array_dpt.zip(hash)]
    p hashi

  rescue OpenURI::HTTPError => e
    if e.message == '404 Not Found'
    else
      raise e
    end

  end

  def get_url_am(regionurl)
    link = Nokogiri::HTML(open(regionurl))
    i = 1 ; j = 1
      while i < 5
        while (j < 42 && i < 6) || j < 41
          doc = link.xpath("/html/body/table/tr[3]/td/table/tr/td[1]/table[2]/tr[2]/td/table/tr/td[#{i}]/p/a[#{j}]/@href")
          doc.each {|doc| get_email(doc.text.sub('.', 'http://annuaire-des-mairies.com'))}
          j += 1
          end
        j = 1
        i += 1
        end
  end

  def get_url_belfort(regionurl)
    link = Nokogiri::HTML(open(regionurl))
    i = 1 ; j = 1
      while i < 4
        while (j < 35 && i < 5) || j < 34
          doc = link.xpath("/html/body/table/tr[3]/td/table/tr/td[1]/table[2]/tr[3]/td/table/tr/td[#{i}]/p/a[#{j}]/@href")
          doc.each {|doc| get_email(doc.text.sub('.', 'http://annuaire-des-mairies.com'))}
          j += 1
          end
          j = 1
          i += 1
        end
  end

  def get_url_var(regionurl)
    link = Nokogiri::HTML(open(regionurl))
    i = 1 ; j = 1
      while i < 4
        while (j < 52 && i < 5) || j < 51
          doc = link.xpath("/html/body/table/tr[3]/td/table/tr/td[1]/table[2]/tr[3]/td/table/tr/td[#{i}]/p/a[#{j}]/@href")
          doc.each {|doc| get_email(doc.text.sub('.', 'http://annuaire-des-mairies.com'))}
          j += 1
          end
          j = 1
          i += 1
        end
  end

end

TownhallsScrapper.new.perform
