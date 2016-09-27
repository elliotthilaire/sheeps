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
      @font.draw("h", @x, @y, 0)
    end
  end
end
