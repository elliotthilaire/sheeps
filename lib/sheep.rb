module Sheeps
  class Sheep
    attr_reader :x, :y
    def initialize(window, x, y)
      @window = window
      @x = x
      @y = y
      @font = Gosu::Font.new(@window, Gosu::default_font_name, 16)
      @image = Gosu::Image.new(@window, 'media/sheep_1.png', false)
    end

    def move
      if Gosu::distance(@x, @y, @window.herder.x, @window.herder.y) < 25
        theta = Gosu::angle(@x, @y, @window.herder.x, @window.herder.y)

        @x -= Gosu::offset_x(theta, 1)
        @y -= Gosu::offset_y(theta, 1)
      end

      if Gosu::distance(@x, @y, @window.dog.x, @window.dog.y) < 40
        theta = Gosu::angle(@x, @y, @window.dog.x, @window.dog.y)

        @x -= Gosu::offset_x(theta, 3)
        @y -= Gosu::offset_y(theta, 3)
      end

      @window.sheep.reject{ |sheep| sheep == self }.each do |sheep|
        distance_to_other_sheep = Gosu::distance(@x, @y, sheep.x, sheep.y)

        if distance_to_other_sheep < 10
           theta = Gosu::angle(@x, @y, sheep.x, sheep.y)
           @x -= Gosu::offset_x(theta, 0.2)
           @y -= Gosu::offset_y(theta, 0.2)
        end

        if distance_to_other_sheep > 30 && distance_to_other_sheep < 200
          theta = Gosu::angle(@x, @y, sheep.x, sheep.y)
          @x += Gosu::offset_x(theta, 0.5)
          @y += Gosu::offset_y(theta, 0.5)
        end
      end
    end

    def draw
      @image.draw(@x, @y, 0, 0.05, 0.05)
    end
  end
end
