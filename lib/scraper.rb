require 'open-uri' # open the file on the internet
require 'nokogiri' # used for @html = Nokogiri::HTML(download) to interpret the contents of the url 


class Scraper

	attr_reader :html # so you can view the data

	def initialize(urls)
		download = open(urls)  # goes to the site and grabs stuff to be stored in download
		# Nokogiri is a class, here we're going insite it as if it was a folder # no @ because we're not saving it
		@html = Nokogiri::HTML(download) # translates the html so ruby can understand it, @ beccause we're saving it 
	end

	def get_one_pokemon
		pokemon = Array.new
		pokemon_temp = Array.new
		pokemon_list = @html.search("h1").to_s().split(">").each {|x| pokemon_temp << x if x.include?("Pokémon") }
		pokemon_temp.join.split(" ").each {|x| pokemon << x if !(x.include?("Pokémon")) }
		pokemon
	end 

#		example = html.search("div.face.front h3").to_s().split("</h3>").each {|x| x.slice!(0..3) }


end



snorlax = Scraper.new("http://bulbapedia.bulbagarden.net/wiki/Snorlax_(Pok%C3%A9mon)") 

puts snorlax.get_one_pokemon.inspect

