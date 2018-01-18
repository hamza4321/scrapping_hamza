require 'rubygems'
require 'nokogiri'
require 'open-uri'

def scrapper_for_dummies(url, path)
	page = Nokogiri::HTML(open(url))
	return page.css(path)
end

def get_the_email_of_a_townhall_from_its_webpage(reste_url)
	url = $base_url + reste_url
	mail = scrapper_for_dummies(url, "td p font")
	mail.each do |mail|
	    if mail.text.include?('@')
	        puts mail.text
	    end
	end
end

def get_url_to_town
	url = $base_url + "val-d-oise.html"
	towns = scrapper_for_dummies(url, "a.lientxt")
	# p $base_url + towns[0]['href']
	towns.each do |town|
    	puts $base_url + town['href'] 
    	get_the_email_of_a_townhall_from_its_webpage(town['href'])
    end
end


#$ = variable globale qui permet d'être utilisée dans une fonction
$base_url = "http://annuaire-des-mairies.com/"

get_url_to_town
# get_the_email_of_a_townhall_from_its_webpage("95/vaureal.html")
# get_the_email_of_a_townhall_from_its_webpage("95/survilliers.html")