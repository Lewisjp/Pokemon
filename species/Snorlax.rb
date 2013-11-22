# Snorlax
# http://bulbapedia.bulbagarden.net/wiki/Snorlax_(Pokémon)

class Snorlax

attr_accessor :type, :abilities, :catch_rate, :entry, :hp, :level, :exp, 

LEARNSET = {
	defense_curl => 4, # normal
	amnesia => 9, # psychic
	lick => 12, # ghost
	belly_drum => 17, # normal
	yawn => 20, # normal
	chip_away => 25, # normal
	rest => 28, # psychic
	snore => 28, # normal
	sleep_talk => 33, # normal
	body_slam => 36, # normal
	block => 41, # normal
	rollout => 44, # rock
	crunch => 49, # dark
	heavy_slam => 52 # steel
	giga_impact => 57 # normal


}

	def initialize
		@type = "normal"
		@catch_rate = .033
		@abilities = ["Immunity", "Thick Fat", "Gluttony"]
		@level = 1
		@egg_group = "monster"
		@base_friendship = 70
		@entry = "Snorlax, the Sleeping Pokémon. Snorlax becomes much too lazy to lift even a finger when it has a full belly, which then makes it safe to bounce upon."
		@hp = 160
		@attack = 110
		@defense = 65
		@sp_atk = 65
		@sp_def = 110
		@speed = 30
		@exp = 189   # Base experience yield, V+ 
		@gender = gender()
	end

	def gender 
		if rand(10) < 4
			"female"
		else
			"male"
		end

	end

  def level_up
    if exp > level**3
      level += 1
  end

  def gain_exp new_exp
    exp += new_exp
  end

  def say_name
  	say = ["Snorlax", "Snorlax!", "ZZZzzzzzzZZZzZzZzz...."]
  	say[rand(3)]
  end


end