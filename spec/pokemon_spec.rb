require '../lib/*'
require_relative '..pokemon_spec'


describe Pokemon, "#Pokemon" do

  it "should return the pokemon's name" do
    expect(Pokemon.say_name).get_one_pokemon).to eql("name")
  end


end