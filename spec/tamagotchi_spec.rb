require('rspec')
require('tamagotchi')

describe(Tamagotchi) do
  describe('#initialize') do
    it('sets the name and a few other properties') do
      my_pet = Tamagotchi.new("Kuchipatchi")
      expect(my_pet.name()).to(eq("Kuchipatchi"))
      expect(my_pet.food_level()).to(eq(10))
      expect(my_pet.sleep_level()).to(eq(10))
      expect(my_pet.activity_level()).to(eq(10))
    end
  end

  describe('#time_passes') do
    it("decreases the amount of food the pobre Tamagotchi has left by 1") do
        my_pet = Tamagotchi.new("Kuchipatchi")
        my_pet.time_passes()
        expect(my_pet.food_level()).to(eq(9))
    end
  end

  describe('#snack_time') do
    it("increases the amount of food the Tamagotchi has by 1") do
      my_pet = Tamagotchi.new("Kuchipatchi")
      my_pet.snack_time()
      expect(my_pet.food_level()).to(eq(11))
    end
  end

  describe('#nap_time') do
    it("puts the Tamagotchi to sleep, and increases sleep_level by 1") do
      my_pet = Tamagotchi.new("Kuchipatchi")
      my_pet.nap_time()
      expect(my_pet.sleep_level()).to(eq(11))
    end
  end

  describe('#play_time') do
    it("plays with the Tamagotchi! and increases activity level by 1") do
      my_pet = Tamagotchi.new("Kuchipatchi")
      my_pet.play_time()
      expect(my_pet.activity_level()).to(eq(11))
    end
  end

  describe("#is_alive") do

    it("is alive if the food, sleep and activity levels are above 0") do
      my_pet = Tamagotchi.new("Kuchipatchi")
      expect(my_pet.is_alive()).to(eq(true))
    end

    it("is dead if the food, sleep, or activity level is 0") do
      my_pet = Tamagotchi.new("Kuchipatchi")
      10.times() do
        my_pet.time_passes()
      end
      expect(my_pet.is_alive()).to(eq(false))
    end

    it("is dead if the food, sleep, or activity level is 20") do
      my_pet = Tamagotchi.new("Kuchipatchi")
      10.times() do
        my_pet.play_time()
      end
      expect(my_pet.is_alive()).to(eq(false))
    end


  end

end
