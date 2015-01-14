require('sinatra')
require('sinatra/reloader')
also_reload('/lib/tamagotchi.rb')
require('./lib/tamagotchi')

get("/") do

  erb(:index)
end

post("/tamagotchi") do
  @name = params.fetch('name') if params.fetch('name')
  @new_pet = Tamagotchi.new(@name)
  @new_pet.save()

  @Tamagotchi = Tamagotchi.last()
puts @Tamagotchi

  @food_level = @Tamagotchi.food_level()
  @sleep_level = @Tamagotchi.sleep_level()
  @activity_level = @Tamagotchi.activity_level()

  erb(:tamagotchi)
end

post("/keep_it_alive") do

  if params.fetch('snack_time').==("food")
    @Tamagotchi.snack_time()
  end

  redirect("/tamagotchi")
end
