require 'open-uri'
require 'nokogiri'


def get_town_email(townhall_url)
  page = Nokogiri::HTML(URI.open(townhall_url))
  scrap_mails = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  return scrap_mails
end

def get_town_urls
  page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  scrap_urls = page.xpath('//p/a')
  towns = scrap_urls.map { |town| "http://annuaire-des-mairies.com/" + town['href'][1..-1] }
  return towns
end

def perform
  towns = get_town_urls
  emails = towns.map { |town| get_town_email(town) }
  names = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html")).xpath('//a[@class="lientxt"]').map { |name| name.text }

  town_emails = names.zip(emails)

  town_emails.map {|name, email| {name => email}}

  # town_emails = []
  # names.each_with_index do |name, i|
  #   town_emails << { name => emails[i] }

end


print "town_emails = "
puts perform