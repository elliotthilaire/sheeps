module Sheeps
  class Sheep
    attr_reader :x, :y
    def initialize(window, x, y)
      @window = window
      @x = x
      @y = y
      @font = Gosu::Font.new(@window, Gosu::default_font_name, 16)
    end

    def move
      if Gosu::distance(@x, @y, @window.herder.x, @window.herder.y) < 25
        theta = Gosu::angle(@x, @y, @window.herder.x, @window.herder.y)

        @x -= Gosu::offset_x(theta, 1)
        @y -= Gosu::offset_y(theta, 1)
      end
    end

    def draw
      @font.draw("s", @x, @y, 0)
    end
  end
end
