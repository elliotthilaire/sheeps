module Sheeps
  class Herder
    attr_reader :x, :y
    def initialize(window, x, y)
      @window = window
      @x = x
      @y = y
      @font = Gosu::Font.new(@window, Gosu::default_font_name, 16)
    end

    # def move
    #   @x += @vel_x
    #   @y += @vel_y
    # end

    def draw
      draw_line(x1, y1, c1, x2, y2, c2, z=0, mode=:default); end
    end
  end
end
