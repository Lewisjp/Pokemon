#Aipom
# http://bulbapedia.bulbagarden.net/wiki/Aipom_(Pokémon)

class Aipom

attr_accessor :type, :abilities, :catch_rate, :entry, :hp, :level, :exp, 

LEARNSET = {
	scratch => 1,
	tail_whip => 1,
	sand_attack => 4, # Ground
	astonish => 8, # Ghost
	baton_pass => 11, 
	tickle => 15, 
	fury_swipes => 18,
	swift => 22,
	screech => 25,
	agility => 29, # psychic
	double_hit => 32,
	fling => 36, # dark
	nasty_plot => 39, # dark
	last_resort => 43 


}

	def initialize
		@type = "normal"
		@catch_rate = .059
		@abilities = ["Run Away", "Pickup", "Skill Link"]
		@level = 1
		@egg_group = "field"
		@base_friendship = 70
		@entry = "Aipom is able to climb and hang from branches using its powerful tail. Aipom live atop tall trees."
		@hp = 55
		@attack = 70
		@defense = 55
		@sp_atk = 40
		@sp_def = 55
		@speed = 85
		@exp = 72   # Base experience yield, V+ 
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

  def gain_exp new_exp
    exp += new_exp
  end

  def say_name
  	say = ["Aipom", "Aipom!", "Ai-POM!"]
  	say[rand(3)]
  end


end