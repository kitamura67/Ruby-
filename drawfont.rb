require 'dxruby'

@font=Font.new(30, "ＭＳ Ｐゴシック", {:weight => false, :italic => true})

Window.loop do
  Window.draw_font( x, 200, "Hello World", @font, {:color => [  0, 206,  0]})
  Window.draw_font(200, 250, "出雲商業", @font, {:color => [255,  78,   0]})
  Window.draw_font(200, 300, "あああ", @font, {:color => [230,  20, 235]})

  break if Input.key_push?(K_ESCAPE)
end