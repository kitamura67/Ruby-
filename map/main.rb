require 'dxruby'
require_relative'map.rb'

map = Map.new

Window.width = 640
Window.height = 480

Window.loop do
    map.draw
end
