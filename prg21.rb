require 'dxruby'

image = Image.new(10, 10, [255, 0, 0])

image2 = Image.new(100, 100)
image2.line(0, 0, 90, 90, [255, 255, 0])

image3 = Image.new(60, 60)
image3.circle_fill(30, 30, 30, [255, 255, 0])


x = 315
y = 235

Window.loop do
  Window.draw(  0,   0, image)
  Window.draw(630,   0, image)
  Window.draw(  0, 470, image)
  Window.draw(630, 470, image)
  Window.draw(  x,   y, image)
  x += 2
  y += -2

  Window.draw(100,100,image2)
  Window.draw(200,200,image2)

  Window.draw(100,100,image3)
  Window.draw(200,200,image3)
end
