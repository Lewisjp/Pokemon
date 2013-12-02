require './lib/scraper.rb'
require './lib/pokemon.rb'
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

	def get_a_pokemon(selected_pokemon)
		single_pokemone_scraper = Scraper.new("http://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_National_Pok%C3%A9dex_number")
		pokemon_data_hash = single_pokemone_scraper.get_one_pokemon("Slowking")
		
		slowking = Pokemon.new(pokemon_data_hash) #create pokemon object with hash of the pokemon type  
		puts slowking.inspect #checks that the new object has everything 

	end

end



pokedex = App.new
pokedex.get_a_pokemon("Slowking")

#slowking = Pokemon.new(pokemon_data_hash)