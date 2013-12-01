require './lib/scraper.rb'
#require './lib/*'
require 'launchy'

class App

	attr_reader :html, :pokemon, :address, :all_the_pokemon  

	def initialize
		pokemon_scraper = Scraper.new("http://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_National_Pok%C3%A9dex_number")
		@address = pokemon_scraper.pokemon_directory

	end

	def pokedex_list
		address.keys
	end

	def web_profile(selected_pokemon)

		profile_url = address.values_at(selected_pokemon) #returns the value of the key in an array
		Launchy.open(profile_url[0]) #open the site value of the pokemon  

	end



end



pokedex = App.new
puts pokedex.web_profile("Slowking")