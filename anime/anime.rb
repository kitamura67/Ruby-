#キャラクタのアニメーション
class Anime
  KOMA = 4 #コマ数
  WAIT = 1 #重み(1以上)
  
  def initialize
    @images = Image.load_tiles('enemy1.png', KOMA, 1)      # 画像読み込んで、縦4,横1に分割して配列に格納（0～3)
    @koma = 0
    @x = 0
    @y = 0
  end

  def draw
    Window.draw(@x, @y, @images[(@koma / WAIT) % KOMA])  #コマを選択して表示
    @koma += 1
  end
end
