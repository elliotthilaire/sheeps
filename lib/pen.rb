module Sheeps
  class Pen
    attr_reader :x, :y, :fence
    def initialize(window, x, y)
      @window = window
      @x = x
      @y = y
      @open = true

      @gate_open_image = Gosu::Image.new(@window, 'media/gate_open.png', false)
      @gate_closed_image = Gosu::Image.new(@window, 'media/gate_closed.png', false)

      @fence = open_fence
    end

    def open_fence
      line_1 = (@x...(@x + @gate_open_image.width)).map { |x_coord| {x: x_coord, y: @y} }
      line_2 = (@y...(@y + @gate_open_image.height)).map { |y_coord| {x: @x, y: y_coord} }
      line_3 = (@y...(@y + (@gate_open_image.height / 2))).map { |y_coord| {x: (@x + @gate_open_image.width), y: y_coord} }
      line_1 + line_2 + line_3
    end

    def open_close
      @open = !@open
    end

    def draw
      if @open == true
        @gate_open_image.draw(@x, @y, 0)
      else
        @gate_closed_image.draw(@x, @y, 0)
      end
    end

  end
end
