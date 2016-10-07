module Sheeps
  class Debugger
    def initialize(window)
      @window = window
      @font = Gosu::Font.new(@window, Gosu::default_font_name, 16)
    end

    def draw
      @font.draw("x: #{mouse_x}, y: #{mouse_y}", 0, 0, 0)
    end

    private

    def mouse_x
      @window.mouse_x
    end

    def mouse_y
      @window.mouse_y
    end
  end
end
