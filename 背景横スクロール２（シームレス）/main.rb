require 'dxruby'

require_relative 'window'
haikei = []
haikei << BackWindow.new(0, 0)
haikei << BackWindow.new(1280 , 0)

Window.loop do
  haikei.each do |h|
    h.move
    h.draw
  end
end
