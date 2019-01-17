require 'rubygems'
require 'nokogiri'  
require 'open-uri'

page = Nokogiri::HTML(open("http://en.wikipedia.org/wiki/HTML"))   
page.css('#mw-content-text div table.infobox tr th').each do |el|
puts el.text
end

