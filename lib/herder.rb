module Sheeps
  class Herder
    attr_reader :x, :y
    def initialize(window, x, y)
      @window = window
      @x = x
      @y = y
      @font = Gosu::Font.new(@window, Gosu::default_font_name, 16)
      @image = Gosu::Image.new(@window, 'media/herder.png', false)
    end

    # def move
    #   @x += @vel_x
    #   @y += @vel_y
    # end

    def left
      @x -= 10
    end
    def right
      @x += 10
    end
    def up
      @y -= 10
    end
    def down
      @y += 10
    end

    def draw
      @image.draw(@x, @y, 0, 0.05, 0.05)
    end
  end
end
