require 'rubygems'
require 'nokogiri'  
require 'open-uri'


def crypto_scrapper
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   

    currencies = []
    page.xpath('//span//a').each do |crypto|
        currencies << crypto.text
    end

    values = []
    page.xpath('//a[@class="price"]').each do |value|
        values << value.text
    end

    hash = currencies.zip(values).to_h
end

puts crypto_scrapper
