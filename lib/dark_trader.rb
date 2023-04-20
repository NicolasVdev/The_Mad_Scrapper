require 'open-uri'
require 'nokogiri'

def scrapper
	page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
end

def cryptocurrencies
  page = scrapper

  all_crypto_names = page.xpath('//tr/td[3]').map {|name| name.text}
	all_crypto_prices = page.xpath('//tr/td[5]').map{|price| price.text.delete('$')}

crypto_pair = all_crypto_names.zip(all_crypto_prices)

crypto_pair.reject {|name, price| price.nil? }
           .map{|name, price| { "#{name}" => price}}

end


puts cryptocurrencies