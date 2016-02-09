require './player.rb'
require './human_player.rb'
require './computer_player.rb'
require './ship.rb'
require './position.rb'
require './grid.rb'




grid = Grid.new
grid.place_ship(Ship.new(2), 3, 6, true)
grid.place_ship(Ship.new(3), 7, 4, true)
grid.place_ship(Ship.new(3), 4, 8, true)
grid.place_ship(Ship.new(4), 1, 1, true)
grid.place_ship(Ship.new(5), 6, 2, false)
puts "#{grid.display}"
