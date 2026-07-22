class BackWindow
  WINDOW_WIDTH = 640
  WINDOW_HEIGHT = 480

  def initialize
    Window.width  = WINDOW_WIDTH
    Window.height = WINDOW_HEIGHT
    @image = Image.load("haikei.png")
    @x = 0
    @y = 0
    @speed = -3
  end

  def move
    @x += Input.x * @speed
    #@x -= @speed
  end

  def draw
    Window.draw(@x, @y, @image)
  end


end
