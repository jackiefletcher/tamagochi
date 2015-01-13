class Tamagotchi
  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @time = Time.new()
  end

  define_method(:name) do
    @name
  end

  define_method(:food_level) do
    @food_level
  end

  define_method(:sleep_level) do
    @sleep_level
  end

  define_method(:activity_level) do
    @activity_level
  end

  define_method(:time_passes) do
    if @time.<(Time.new())
      @food_level = @food_level.-(1)
      @sleep_level = @sleep_level.-(1)
      @activity_level = @activity_level.-(1)
    end
  end

  define_method(:snack_time) do
    @food_level = @food_level.+(1)
  end

  define_method(:nap_time) do
    @sleep_level = @sleep_level.+(1)
  end

  define_method(:play_time) do
    @activity_level = @activity_level.+(1)
  end

  define_method(:is_alive) do
    @food_level.>(0).&(@sleep_level.>(0)).&(@activity_level.>(0)).&(@food_level.<(20)).&(@sleep_level.<(20)).&(@activity_level.<(20))
  end

end
