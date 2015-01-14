require('sinatra')
require('sinatra/reloader')
also_reload('/lib/tamagotchi.rb')
require('./lib/tamagotchi')

get("/") do

  erb(:index)
end

post("/tamagotchi") do
  if params['name'] != nil
    @name = params.fetch('name')
    @new_pet = Tamagotchi.new(@name)
    @new_pet.save()
    puts "this got saved"
  end

  @tamagotchi = Tamagotchi.last()
  @food_level = @tamagotchi.food_level()
  @sleep_level = @tamagotchi.sleep_level()
  @activity_level = @tamagotchi.activity_level()

  erb(:tamagotchi)
end

post("/keep_it_alive") do

  Tamagotchi.last().snack_time()

  @tamagotchi = Tamagotchi.last()

  @name = @tamagotchi.name()
  @food_level = @tamagotchi.food_level()
  @sleep_level = @tamagotchi.sleep_level()
  @activity_level = @tamagotchi.activity_level()
  erb(:tamagotchi)
end
