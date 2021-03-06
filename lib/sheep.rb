module Sheeps
  class Sheep
    attr_reader :x, :y
    def initialize(window, x, y)
      @window = window
      @x = x
      @y = y
      @image = Gosu::Image.new(@window, random_sheep_image, false)
      @direction = 0
    end

    def move
      other_sheep.each do |sheep|
        distance_to_other_sheep = Gosu::distance(@x, @y, sheep.x, sheep.y)

        if distance_to_other_sheep < 50
           theta = Gosu::angle(sheep.x, sheep.y, @x, @y)
           @x += Gosu::offset_x(theta, 0.7)
           @y += Gosu::offset_y(theta, 0.7)
        end

        if distance_to_other_sheep > 100 && distance_to_other_sheep < 200
          theta = Gosu::angle(@x, @y, sheep.x, sheep.y)
          @x += Gosu::offset_x(theta, 0.5)
          @y += Gosu::offset_y(theta, 0.5)
        end
      end

      if Gosu::distance(@x, @y, herder.x, herder.y) < 45
        @direction = Gosu::angle(herder.x, herder.y, @x, @y)
        @x += Gosu::offset_x(@direction, 1)
        @y += Gosu::offset_y(@direction, 1)
      end

      if Gosu::distance(@x, @y, dog.x, dog.y) < 120
        @direction = Gosu::angle(dog.x, dog.y, @x, @y)
        @x += Gosu::offset_x(@direction, 3)
        @y += Gosu::offset_y(@direction, 3)
      end

      pen.fence.each do |fence_point|
        if Gosu::distance(@x, @y, fence_point[:x], fence_point[:y]) < 3
          @direction = Gosu::angle(fence_point[:x], fence_point[:y], @x, @y)
          @x += Gosu::offset_x(@direction, 3)
          @y += Gosu::offset_y(@direction, 3)
        end
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

    def dog
      @window.dog
    end

    def other_sheep
      @window.sheep.reject{ |sheep| sheep == self }
    end

    def pen
      @window.pen
    end

    def random_sheep_image
      ['media/sheep_1.png','media/sheep_2.png','media/sheep_3.png'].sample
    end
  end
end
