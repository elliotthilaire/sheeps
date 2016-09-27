
require 'gosu'

require_relative 'lib/sheep'
require_relative 'lib/herder'
require_relative 'lib/dog'

module Sheeps
  class Game < Gosu::Window

    def initialize(x=1200, y=800, resize=false)
      super
      @sheep = []
      5.times do
        @sheep << Sheep.new(self, rand(x), rand(y))
      end

      @herder = Herder.new(self, rand(x), rand(y))
      @dog = Dog.new(self, rand(x), rand(y))
    end

    def update
      # sheep.each do |sheep|
      #   sheep.move
      # end
      #
      # herder.move
      # dog.move
    end

    def draw
      @sheep.each { |sheep| sheep.draw }
      @herder.draw
      @dog.draw
    end

    def button_up(id)
    end

    def button_down(id)
      close if id == Gosu::KbEscape
    end

  end
end

Sheeps::Game.new.show
