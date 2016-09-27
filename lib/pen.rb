module Sheeps
  class Pen
    attr_reader :x, :y
    def initialize(window, x, y)
      @window = window
      @x = x
      @y = y
      @open = false

      @gate_open_image = Gosu::Image.new(@window, 'media/gate_open.png', false)
      @gate_closed_image = Gosu::Image.new(@window, 'media/gate_closed.png', false)
    end

    def draw
      if @open == true
        @gate_open_image.draw(@x, @y, 0)
      else
        @gate_open_image.draw(@x, @y, 0)
      end
    end
  end
end
