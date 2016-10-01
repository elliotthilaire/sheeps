module Sheeps
  class Pen
    attr_reader :x, :y
    def initialize(window, x, y)
      @window = window
      @x = x
      @y = y
      @open = true
    end

    def fence
      top_fence = (@x...@x + image.width).map { |x_coord| { x: x_coord, y: @y } }
      left_fence = (@y...@y + (image.height / 2)).map { |y_coord| { x: @x, y: y_coord } }
      right_fence = (@y...@y + (image.height / 2)).map { |y_coord| { x: @x + image.width, y: y_coord } }
      open_gate = (@y + image.height / 2...@y + image.height).map { |y_coord| { x: @x, y: y_coord } }
      closed_gate = (@x...@x + image.width).map { |x_coord| { x: x_coord, y: @y + image.height / 2 } }
      fence = top_fence + left_fence + right_fence
      if @open
        fence += open_gate
      else
        fence += closed_gate
      end
      fence
    end

    def open_close
      @open = !@open
    end

    def draw
      image.draw(@x, @y, 0)
    end

    private

    def image
      if @open
        @open_image ||= Gosu::Image.new(@window, 'media/gate_open.png', false)
      else
        @closed_image ||= Gosu::Image.new(@window, 'media/gate_closed.png', false)
      end
    end
  end
end
