module Sheeps
  class Herder
    attr_reader :x, :y
    def initialize(window, x, y)
      @window = window
      @x = x
      @y = y
      @font = Gosu::Font.new(@window, Gosu::default_font_name, 16)
      @image = Gosu::Image.new(@window, 'media/herder.png', false)
      @direction = 0
    end

    # def move
    #   @x += @vel_x
    #   @y += @vel_y
    # end

    def left
      @x -= 10
      @direction = 270
    end
    def right
      @x += 10
      @direction = 90
    end
    def up
      @y -= 10
    end
    def down
      @y += 10
    end

    def draw
      offset_x = @image.width / 2
      offset_y = @image.height / 2
      if @direction > 0 && @direction < 180
        @image.draw(@x - offset_x, @y, 0, 1, 1)
      else
        @image.draw(@x, @y - offset_y, 0, -1, 1)
      end
    end
  end
end
