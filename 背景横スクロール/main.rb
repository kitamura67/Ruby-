require 'dxruby'

require_relative 'window'
haikei = BackWindow.new

Window.loop do
  haikei.move
  haikei.draw
end
