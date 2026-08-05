class Hero
  attr_reader :x, :y
  def initialize( x, y)
    @image = Image.load("image/hero.png")
    @image.set_color_key(Color::WHITE)
    @x = x
    @y = y
    @speed = 3
  end

  def center_x
    return @x + @image.width / 2
  end

  def center_y
    return @y + @image.height / 2
  end

  def move
    @x += Input.x * @speed
    @y += Input.y * @speed
    if @x < 0 #@x = 0 if @x < 0
      @x = 0
    end

    if @x > 546
      @x = 546
    end

    if @y < 0
      @y = 0
    end

    if @y > 400 - 38
      @y = 400 - 38
    end
  end

  def draw
    Window.draw(@x, @y, @image)
  end
end