require 'nokogiri'
require 'open-uri'
require 'pry'

# Récupère l'adresse email, prend en parametre le lien de la page de la mairie 
def get_email(url)
    arr_email = []
    page = Nokogiri::HTML(open(url))
    #page.xpath('//dl[@class="deputes-liste-attributs"]//a[contains(@href, "@assemblee")]/@href').each do |email|
    page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[1]/a/@href').each do |email|
      arr_email.push(email.value)
    end
    arr_email
end

# récupère la liste de tout les liens redirigeant vers les pages de chaque mairie
def get_urls
    arr_url_deputes = []
    page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
    page.xpath('//a[contains(@href, "OMC")]/@href').each do |url|
        arr_url_deputes.push(url.value)
    end
    # boucle pour formater les liens des fiches des députés & appelle get_email
    arr_url_deputes.each do |elem|
        elem = "http://www2.assemblee-nationale.fr" + elem
        get_email(elem)
    end
    arr_email.each do |email|
      email.gsub("mailto:", '*')
      puts email
  end
end

# get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")
#get_email()
get_urls
