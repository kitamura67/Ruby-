class Bomb
  attr_reader :x, :y
  def initialize
    @image = Image.load("image/bomb.png")
    @image.set_color_key(Color::WHITE)
    reset
  end

  def drop
    @y = @y + @speed_y
    @x = @x + @speed_x
    if @y > BackWindow::WINDOW_HEIGHT
      reset
    end
  end

  def center_x
    return @x + @image.width / 2
  end

  def center_y
    return @y + @image.height / 2
  end

  def reset
    @x = rand(BackWindow::WINDOW_WIDTH)
    @y = 0
    #@speed_y = 1
    @speed_y = rand(3..7)
    #@speed_x = 1
    @speed_x = rand(-2..4)
    #puts @speed_y
  end

  def draw
    Window.draw(@x, @y, @image)
  end
end