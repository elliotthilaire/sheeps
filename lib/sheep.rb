module Sheeps
  class Sheep
    attr_reader :x, :y
    def initialize(window, x, y)
      @window = window
      @x = x
      @y = y
      @font = Gosu::Font.new(@window, Gosu::default_font_name, 16)
      @image = Gosu::Image.new(@window, 'media/sheep_1.png', false)
      @direction = 0
    end

    def move
      if Gosu::distance(@x, @y, @window.herder.x, @window.herder.y) < 25
        theta = Gosu::angle(@x, @y, @window.herder.x, @window.herder.y)

        @x -= Gosu::offset_x(theta, 1)
        @y -= Gosu::offset_y(theta, 1)
        @direction = theta
      end

      if Gosu::distance(@x, @y, @window.dog.x, @window.dog.y) < 40
        theta = Gosu::angle(@x, @y, @window.dog.x, @window.dog.y)

        @x -= Gosu::offset_x(theta, 3)
        @y -= Gosu::offset_y(theta, 3)
        @direction = theta
      end

      @window.sheep.reject{ |sheep| sheep == self }.each do |sheep|
        distance_to_other_sheep = Gosu::distance(@x, @y, sheep.x, sheep.y)

        if distance_to_other_sheep < 25
           theta = Gosu::angle(@x, @y, sheep.x, sheep.y)
           @x -= Gosu::offset_x(theta, 0.2)
           @y -= Gosu::offset_y(theta, 0.2)
           @direction = theta
        end

        if distance_to_other_sheep > 50 && distance_to_other_sheep < 200
          theta = Gosu::angle(@x, @y, sheep.x, sheep.y)
          @x += Gosu::offset_x(theta, 0.5)
          @y += Gosu::offset_y(theta, 0.5)
          @direction = theta
        end
      end
    end

    def draw
      offset_x = @image.width / 2
      offset_y = @image.height / 2
      if @direction > 0 && @direction < 180
        @image.draw(@x - offset_x, @y, 0, 1, 1)
      else
        @image.draw(@x, @y - offset_y, 0, -1, 1)
      end
    end
  end
end
