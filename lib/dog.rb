module Sheeps
  class Dog
    attr_reader :x, :y
    def initialize(window, x, y)
      @window = window
      @x = x
      @y = y
      @image = Gosu::Image.new(@window, 'media/dog.png', false)
      @direction = 0
      @command = nil
    end

    def command(command)
      @command = command
    end

    def move
      if @command == :come
        if Gosu::distance(@x, @y, herder.x, herder.y) >= 35
          @direction = Gosu::angle(@x, @y, herder.x, herder.y)
          @x += Gosu::offset_x(@direction, 5)
          @y += Gosu::offset_y(@direction, 5)
        end
      end

      if @command == :go
        if Gosu::distance(@x, @y, herder.x, herder.y)
          @direction = Gosu::angle(herder.x, herder.y, @x, @y)
          @x += Gosu::offset_x(@direction, 5)
          @y += Gosu::offset_y(@direction, 5)
        end
      end

      if @command == :left
        @direction = Gosu::angle(@x, @y, closest_sheep.x, closest_sheep.y) + 60
        @x += Gosu::offset_x(@direction, 4)
        @y += Gosu::offset_y(@direction, 4)
      end

      if @command == :right
        @direction = Gosu::angle(@x, @y, closest_sheep.x, closest_sheep.y) - 60
        @x += Gosu::offset_x(@direction, 4)
        @y += Gosu::offset_y(@direction, 4)
      end
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

    private

    def herder
      @window.herder
    end

    def closest_sheep
      @window.sheep.sort_by do |sheep|
        Gosu::distance(@x, @y, sheep.x, sheep.y)
      end.first
    end

    def obstacles
      @window.obstacles
    end
  end
end
