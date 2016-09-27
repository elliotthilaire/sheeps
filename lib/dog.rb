module Sheeps
  class Dog
    attr_reader :x, :y
    def initialize(window, x, y)
      @window = window
      @command = nil
      @x = x
      @y = y
      @font = Gosu::Font.new(@window, Gosu::default_font_name, 16)
    end

    def command(command)
      @command = command
    end

    def move
      if @command == :come
        if Gosu::distance(@x, @y, @window.herder.x, @window.herder.y) >= 20
          theta = Gosu::angle(@x, @y, @window.herder.x, @window.herder.y)

          @x += Gosu::offset_x(theta, 5)
          @y += Gosu::offset_y(theta, 5)
        end
      end

      if @command == :go
        if Gosu::distance(@x, @y, @window.herder.x, @window.herder.y)
          theta = Gosu::angle(@x, @y, @window.herder.x, @window.herder.y)

          @x -= Gosu::offset_x(theta, 5)
          @y -= Gosu::offset_y(theta, 5)
        end
      end

    end

    def draw
      @font.draw("d", @x, @y, 0)
    end
  end
end
