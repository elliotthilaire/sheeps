module Sheeps
  class Fence
    attr_reader :x1, :y1, :x2, :y2
    def initialize(window, x1, y1, x2, y2)
      @window = window
      @x1 = x1
      @y1 = y1
      @x2 = x2
      @y2 = y2
    end

    def draw
      red = Gosu::Color.argb(0xff_ff0000)
      @window.draw_line(@x1, @y1, red, @x2, @y2, red, z = 0, mode = :default)
    end
  end
end
