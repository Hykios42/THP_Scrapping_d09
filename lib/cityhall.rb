require 'nokogiri'
require 'open-uri'
require 'pry'

# Récupère l'adresse email , prend en parametre le liens de la page de la mairie 
def get_townhall_email(townhall_url)
    arr_email = []
    page = Nokogiri::HTML(open(townhall_url))   
    page.xpath('//td[contains(text(),"@")]').each do |el|
         arr_email.push(el.text)
    end
    puts arr_email
end

# récupére la liste de tout les liens redirigeant vers les pages de chaque mairie
def get_townhall_urls
    arr_mairies = []
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    page.xpath('//a[contains(@href, "95")]/@href').each do |el|
        arr_mairies.push(el.value)
    end
    # boucle pour formaté les liens des mairies & appel de get_townhall_email
    arr_mairies.each do |elem|
        elem = elem[1..-1]
        tmp_str = "https://www.annuaire-des-mairies.com" + elem
        get_townhall_email(tmp_str)
    end
end

# TEST façon mage noir
# get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")
# get_townhall_urls