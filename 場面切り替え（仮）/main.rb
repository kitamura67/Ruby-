

require 'dxruby'

Window.width = 800
Window.height = 600

haikei01 = Image.load("01.png")
haikei02 = Image.load("02.png")
haikei03 = Image.load("03.png")

ya = Image.load("ya.png")

font = Font.new(25,"ＭＳ Ｐゴシック")

bamen = 0
sw = 0
flg = 0

Window.loop do

	if bamen == 0 then
		Window.draw(0,0,haikei01)
		
		Window.draw_font(200,510,"美術室",font,color:[253,126,0])
		Window.draw_font(500,510,"プール",font,color:[253,126,0])
			
		if Input.key_push?(K_LEFT) then
			flg = 0
		elsif Input.key_push?(K_RIGHT) then
			flg = 1
		end
			
		if flg == 0 then
			Window.draw(150,510,ya)
			sw = 1
		elsif flg == 1 then
			Window.draw(450,510,ya)
			sw = 2
		end
		
		if Input.key_push?(K_RETURN)
			if sw == 1 then
				bamen = 1
			elsif sw == 2 then
				bamen = 2
			end	
		end
		
	elsif bamen == 1 then
		Window.draw(0,0,haikei02)
	elsif bamen == 2 then
		Window.draw(0,0,haikei03)
	end
	
end

