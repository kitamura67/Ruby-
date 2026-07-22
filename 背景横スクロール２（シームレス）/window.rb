class BackWindow
  WINDOW_WIDTH = 640
  WINDOW_HEIGHT = 480

  def initialize(x, y)
    Window.width  = WINDOW_WIDTH
    Window.height = WINDOW_HEIGHT
    @image = Image.load("haikei.png")
    @x = x
    @y = y
    @speed = -10
  end

  def move
    #@x -= @speed
    @x += Input.x * @speed

    if @x < @image.width * -1
      @x += @image.width * 2
    end

    if @x > (@image.width + @speed) #@speedをなぜ足すかは説明不可能（感覚です）
      @x *= -1
    end

  end

  def draw
    Window.draw(@x, @y, @image)
  end


end
