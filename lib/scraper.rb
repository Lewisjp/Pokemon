require 'open-uri' # open the file on the internet
require 'nokogiri' # used for @html = Nokogiri::HTML(download) to interpret the contents of the url 


class Scraper #base for the pokemon class 

	attr_reader :html, :pokemon, :address, :all_the_pokemon  # get individual url for the pokemon

	def initialize(urls)
		download = open(urls)  # goes to the site and grabs stuff to be stored in download
		# Nokogiri is a class, here we're going insite it as if it was a folder # no @ because we're not saving it
		@html = Nokogiri::HTML(download) # translates the html so ruby can understand it, @ beccause we're saving it 
		@pokemon = Array.new
		@address = Hash.new 
		@all_the_pokemon = Array.new
	end


	def get_one_pokemon(selected_pokemon)
		poke = Hash.new  #Hash stores particular pokemone traits

		if address.empty?  #makes sure the pokedex address book is accurate
		 	get_pokemon_names
		end

		if address.has_key?(selected_pokemon) # verifies requested pokemon

			pokemon_temp = Array.new
			one_download = open("http://bulbapedia.bulbagarden.net/wiki/" + selected_pokemon + "_(Pok%C3%A9mon)")
			one_pokemon = Nokogiri::HTML(one_download)
			pokemon_data = one_pokemon.search("h1").to_s().split(">").each {|x| pokemon_temp << x if x.include?("Pokémon") }
			pokemon_temp.join.split(" ").each {|x| poke[:name] = x if !(x.include?("Pokémon")) }

			#pokemon_data = one_pokemon.search(a.href.title).to_s().split(">").each {|x| pokemon_temp << x if x.include?("Ability") }
			#puts pokemon_data
			#pokemon_temp.join.split(" ").each {|x| poke[:hp] = x if !(x.include?("Pokémon")) }

		else	
			puts "Invalid Pokemon."
		end
		poke
	end 


	def get_pokemon_names
		all_the_pokemon = html.search('a[href$="(Pok%C3%A9mon)"]').collect {|item| item.text}.compact.keep_if { |x| x != "" }
			all_the_pokemon.each do |pokemon|
			address[pokemon] = "http://bulbapedia.bulbagarden.net/wiki/" + (pokemon) + "_(Pok%C3%A9mon)"
			end
		all_the_pokemon
	end

	def pokemon_directory
		if address.empty?
		 	get_pokemon_names
		end
		address
	end


end 


Slowking = Scraper.new("http://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_National_Pok%C3%A9dex_number")



# pokedex = Scraper.new("http://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_National_Pok%C3%A9dex_number") 


# puts pokedex.pokemon_directory["Avalugg"] #=> "http://bulbapedia.bulbagarden.net/wiki/Avalugg_(Pok%C3%A9mon)"



