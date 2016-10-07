module Sheeps
  class Obstacle
    attr_reader :x, :y, :width, :height
    def initialize(window, x, y, width, height)
      @window = window
      @x = x
      @y = y
      @width = width
      @height = height
    end

    def inside?(x, y)
      x.between?(@x, @x + @width) && y.between?(@y, @y + @height)
    end

    def draw
      red = Gosu::Color.argb(0xff_ff0000)
      @window.draw_quad(@x, @y, red, @x, @y+@height, red, @x+@width, @y, red, @x + @width, @y + @height, red, z = 0, mode = :default)
    end
  end
end
