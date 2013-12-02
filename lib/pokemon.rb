

class Pokemon  #in the future add inheritance from scrapper 


attr_accessor :type, :abilities, :catch_rate, :entry, :hp, :level, :exp, :name

LEARNSET = Hash.new 

	def initialize(pokemon_data_hash)
		@name = pokemon_data_hash[:name] || "Mystery Pokemon"
		@type = "normal"
		@catch_rate = 0.0
		@abilities = [""]
		@level = 1
		@egg_group = "monster"
		@base_friendship = 0
		@entry = ""
		@hp = 0
		@attack = 0
		@defense = 0
		@sp_atk = 0
		@sp_def = 0
		@speed = 0
		@exp = 0   # Base experience yield, V+ 
		@gender = gender()
	end

	def gender 
		if rand(2) > 0
			"female"
		else
			"male"
		end

	end

  def level_up
    if exp > level**3
      level += 1
  	end
  end

  def gain_exp new_exp
    exp += new_exp
  end


  def say_name
  	say = "name"
  end


end