require('sinatra')
require('sinatra/reloader')
also_reload('/lib/tamagotchi.rb')
require('./lib/tamagotchi')

get("/") do

  erb(:index)
end

post("/tamagotchi") do
  @name = params.fetch('name')
  @new_pet = Tamagotchi.new(@name)

  @food_level = @new_pet.food_level()
  @sleep_level = @new_pet.sleep_level()
  @activity_level = @new_pet.activity_level()

  erb(:tamagotchi)
end
# 
# post("/keep_it_alive") do
#
#   if params.fetch('snack_time').==("food")
#     @new_pet.snack_time()
#   end
#
#   redirect("/tamagotchi")
# end
