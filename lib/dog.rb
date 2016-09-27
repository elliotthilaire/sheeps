module Sheeps
  class Dog
    attr_reader :x, :y
    def initialize(window, x, y)
      @window = window
      @command = nil
      @x = x
      @y = y
      @image = Gosu::Image.new(@window, 'media/dog.png', false)
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

      if @command == :left
        theta = Gosu::angle(@x, @y, closest_sheep.x, closest_sheep.y) + 60

        @x += Gosu::offset_x(theta, 4)
        @y += Gosu::offset_y(theta, 4)
      end

      if @command == :right
        theta = Gosu::angle(@x, @y, closest_sheep.x, closest_sheep.y) - 60

        @x += Gosu::offset_x(theta, 4)
        @y += Gosu::offset_y(theta, 4)
     end
   end

    def closest_sheep
      @window.sheep.sort_by do |sheep|
        Gosu::distance(@x, @y, sheep.x, sheep.y)
      end.first
    end

    def draw
      @image.draw(@x, @y, 0, 0.05, 0.05)
    end
  end
end
