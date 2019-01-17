require 'nokogiri'
require 'open-uri'
require 'pry'

# Récupère l'adresse email, prend en parametre le lien de la page de la mairie 
def get_email(url)
  list = ""
    page = Nokogiri::HTML(open(url))
    page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[1]/a/@href').each do |email|
      list += email.text
    end
end

# récupère la liste de tout les liens redirigeant vers les pages de chaque mairie
def get_urls
    arr_url_deputes = []
    arr_email_deputes = []
    page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
    page.xpath('//a[contains(@href, "OMC")]/@href').each do |url|
        arr_url_deputes.push(url.value)
    end
    # boucle pour formater les liens des fiches des députés & appelle get_email
    arr_url_deputes.each do |elem|
        elem = "http://www2.assemblee-nationale.fr" + elem
        puts get_email(elem)
    end

    #arr_email_deputes.each do |email|
    #  email = email.delete_prefix("mailto")
    #end
end

# get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")
#get_email("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA719024")
get_urls