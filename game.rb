require 'gosu'

require_relative 'lib/sheep'
require_relative 'lib/herder'
require_relative 'lib/dog'
require_relative 'lib/pen'
require_relative 'lib/debugger'

module Sheeps
  class Game < Gosu::Window

    attr_reader :herder, :sheep, :dog, :pen

    def initialize(x=1200, y=800, resize=false)
      super

      @sheep = Array.new(10) { Sheep.new(self, rand(x), rand(y)) }
      @herder = Herder.new(self, rand(x), rand(y))
      @dog = Dog.new(self, rand(x), rand(y))
      @pen = Pen.new(self, 750, 200)

      @field = Gosu::Image.new('media/field.jpg', false)
      @debugger = Debugger.new(self)
    end

    def update
      @sheep.each do |sheep|
        sheep.move
      end

      dog.move
    end

    def draw
      @field.draw(0,0,0,0.5,0.5)
      @pen.draw

      @sheep.each { |sheep| sheep.draw }
      @herder.draw
      @dog.draw
      @debugger.draw
    end

    def button_up(id)
    end

    def button_down(id)
      @herder.left if id == Gosu::KbLeft
      @herder.right if id == Gosu::KbRight
      @herder.up if id == Gosu::KbUp
      @herder.down if id == Gosu::KbDown

      @dog.command(:come) if id == Gosu::KbS
      @dog.command(:stay) if id == Gosu::KbSpace
      @dog.command(:go) if id == Gosu::KbW
      @dog.command(:left) if id == Gosu::KbA
      @dog.command(:right) if id == Gosu::KbD

      @pen.toggle_gate if id == Gosu::KbSpace

      close if id == Gosu::KbEscape
    end

    def needs_cursor?
      true
    end
  end
end

Sheeps::Game.new.show
