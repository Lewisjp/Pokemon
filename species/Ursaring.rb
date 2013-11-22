# Ursaring
# http://bulbapedia.bulbagarden.net/wiki/Ursaring_(Pokémon)


class Ursaring

attr_accessor :type, :abilities, :catch_rate, :entry, :hp, :level, :exp, 

LEARNSET = {
	covet => 1,
	scratch => 1,
	leer => 1,
	lick => 1, # Ghost
	fake_tears => 1, # Dark
	fury_swipes => 8,
	faint_attack => 15, # Dark
	sweet_scent => 22,
	slash => 29,
	scary_face => 38,
	rest => 47, # psychic
	snore => 49, 
	thrash => 58,
	hammer_arm => 67 # fighting 


}

	def initialize
		@type = "normal"
		@catch_rate = .059
		@abilities = ["Guts", "Quick Feet", "Unnerve"]
		@level = 1
		@egg_group = "field"
		@base_friendship = 70
		@entry = "Ursaring, the Hibernator Pokémon. Ursaring searches for honey in a forest daily. To reach its food, it often snaps trees with its four legs rather than climbing."
		@hp = 90
		@attack = 130
		@defense = 75
		@sp_atk = 75
		@sp_def = 75
		@speed = 55
		@exp = 175   # Base experience yield, V+ 
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
  	"Ursaring!"
  end


end