require 'dxruby'
require_relative'anime.rb'

anime = Anime.new

Window.width = 640
Window.height = 480

Window.loop do
    anime.move
    anime.draw
end
