require 'rubygems'
require 'nokogiri'  
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   
page.css('//span[contains(text(),"Go")]').each do |el|
puts el.text
end
#array_currency.push()



#//div[@id="currencies-all_wrapper"]
#//td[@class="currency-name"]//a[@class="currency-name-container"]