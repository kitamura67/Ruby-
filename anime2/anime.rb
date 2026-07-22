#キャラクタのアニメーション
class Anime
  KOMA  = 3  #コマ数
  WAIT  = 10 #重み(1以上)
  UP    = 9  #それぞれの向きのコマの開始位置
  DOWN  = 0
  LEFT  = 3
  RIGHT = 6

  def initialize
    @images = Image.load_tiles('sample001.png', 3, 4)      # 画像読み込んで、縦4,横3に分割して配列に格納（0～11)
    @koma = 0
    @x = 0
    @y = 0
    @speed = 3
    @move = 0
  end

  def move
    @move_x = Input.x
    @move_y = Input.y
    if @move_x  == -1
      @x -= @speed
      @move = LEFT
    elsif @move_x == 1
      @x += @speed
      @move = RIGHT
    end

    if @move_y == -1
      @y -= @speed
      @move = UP
    elsif @move_y == 1
      @y += @speed
      @move = DOWN
    end
  end

  def draw
    Window.draw(@x, @y, @images[((@koma / WAIT) % KOMA) + @move])  #コマを選択して表示
    @koma += 1
  end
end
