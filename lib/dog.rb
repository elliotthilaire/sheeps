module Sheeps
  class Dog
    attr_reader :x, :y
    def initialize(window, x, y)
      @window = window
      @command = nil
      @x = x
      @y = y
      @image = Gosu::Image.new(@window, 'media/dog.png', false)
      @direction = 0
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
          @direction = theta
        end
      end

      if @command == :go
        if Gosu::distance(@x, @y, @window.herder.x, @window.herder.y)
          theta = Gosu::angle(@x, @y, @window.herder.x, @window.herder.y)

          @x -= Gosu::offset_x(theta, 5)
          @y -= Gosu::offset_y(theta, 5)
          @direction = theta
        end
      end

      if @command == :left
        theta = Gosu::angle(@x, @y, closest_sheep.x, closest_sheep.y) + 60

        @x += Gosu::offset_x(theta, 4)
        @y += Gosu::offset_y(theta, 4)
        @direction = theta
      end

      if @command == :right
        theta = Gosu::angle(@x, @y, closest_sheep.x, closest_sheep.y) - 60

        @x += Gosu::offset_x(theta, 4)
        @y += Gosu::offset_y(theta, 4)
        @direction = theta
     end
   end

    def closest_sheep
      @window.sheep.sort_by do |sheep|
        Gosu::distance(@x, @y, sheep.x, sheep.y)
      end.first
    end

    def draw
      offset_x = @image.width / 2
      offset_y = @image.height / 2
      if @direction > 0 && @direction < 180
        @image.draw(@x - offset_x, @y - offset_y, 0, 1, 1)
      else
        @image.draw(@x + offset_x, @y - offset_y, 0, -1, 1)
      end
    end
  end
end
