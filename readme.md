# Sheeps

A sheep herding game made in a day at [http://scotland.railscamp.eu/])Rails Camp Scotland 2016).

![screen_1.jpg]

The day before arriving at Rails Camp in Scotland we turned on the TV in our motel and watched sheep herding championships.

I decided to make a game. I looked up the commands the herders used

## Setup

1. Install [https://github.com/gosu/gosu/wiki](gosu)

e.g.

```
brew install sdl2
```

2. Install gems
```
bundle install
```

3. Launch the game
```
ruby game.rb
```

## Controls

Based on real life sheep herding commands

w Find - search for the stock
a Come-bye - go to the left of the stock, or clockwise around them
s Away to me - go to the right of the stock or counter clockwise around them.
d That'll do - stop working and return to the handler.

arrow keys - walk

space - close/open the gate

## Contribution

Pull requests welcome. Here's some ideas.
* Stop sheep running through fence
* Remove farmers telepathic gate opening/closing powers
* Add sound effects (farmer commands, sheep and dog noises)
* Clean up graphics
* Add a splash screen to start and restart the game
* Prevent pen from appearing off the edge of the screen sometimes
* Refactoring
* Add ability to control via voice commands (hint: pocketsphinx gem)


## Other real life sheep herding commands

Taken from wikipedia. These haven't been implemented yet.

Stand - stop, although when said gently may also mean just to slow down

Steady - slow down

Get out or back - move away from the stock. Use when the dog

Speak up - bark at the stock. Useful when more force is needed.
