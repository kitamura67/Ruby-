require 'dxruby'
require_relative 'color'
require_relative 'window'
require_relative 'hero'
require_relative 'item'

def hit?(hero, bomb)
  diffx = hero.center_x - bomb.center_x
  diffy = hero.center_y - bomb.center_y
  if (diffx > -20) and (diffx < 20) and (diffy > -20) and (diffy < 20) #二乗は(**2)
    return true
  else
    return false
  end
end

def clicked?(obj)
  clicked = false
  if Input.mouse_push?(M_LBUTTON)
    diffx = Input.mouse_pos_x - obj.center_x
      diffy = Input.mouse_pos_y - obj.center_y
      if (diffx > -20) and (diffx < 20) and (diffy > -20) and (diffy < 20)
        clicked = true
      end
  end
  return clicked
end

def game_over(backwindow, hero)
  backwindow.draw_endback
  hero.draw
  Window.update
  sleep 2
  exit
end

backwindow = BackWindow.new
hero = Hero.new(320 - 56 / 2, 362)

NBOMB = 3
NAPPLE = 2
NORANGE = 1

bombs = []
NBOMB.times do
  bombs << Bomb.new
end

apples = []
NAPPLE.times do
  apples << Apple.new
end

oranges = []
NORANGE.times do
  oranges << Orange.new
end

score = 0
click_count = 0

LIMETIME = 20
start_time = Time.now

Window.loop do
  hero.move

  bombs.each do |bomb|
    bomb.drop
  end

  apples.each do |apple|
    apple.drop
  end

  oranges.each do |orange|
    orange.drop
  end

  backwindow.draw
  hero.draw

  bombs.each do |bomb|
    bomb.draw
  end

  apples.each do |apple|
    apple.draw
  end

  oranges.each do |orange|
    orange.draw
  end
  
  now_time = Time.now
  elapsed_time = now_time - start_time
  time = LIMETIME - elapsed_time.to_i

  if score >= 50 && time > 0
    backwindow.draw_endclear
    hero.draw
    Window.update
    sleep 2
    exit
  end

  apples.each do |apple|
    if hit?(hero,apple)
      score += apple.get_score
      apple.reset
    end
  end

  oranges.each do |orange|
    if hit?(hero,orange)
      score += orange.get_score
      orange.reset
    end
  end

  bombs.each do |bomb|
    if hit?(hero,bomb)
      game_over(backwindow,hero)
    end
  end

  bombs.each do |bomb|
    if clicked?(bomb)
      game_over(backwindow,hero)
    end
  end

  apples.each do |apple|
    if clicked?(apple)
      score += apple.get_score
      click_count += 1
      apple.reset
    end
  end

  oranges.each do |orange|
    if clicked?(orange)
      score += orange.get_score
      click_count += 1
      orange.reset
    end
  end

  backwindow.write_char(50, 400, "あなたの得点は#{score}点", Color::WHITE)
  backwindow.write_char(300, 400, "残り時間は#{time}秒です",  Color::WHITE)
  backwindow.write_char(50, 440, "クリック#{click_count}回",  Color::WHITE)

  break if Input.key_push?(K_ESCAPE)

end