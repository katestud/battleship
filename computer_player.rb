require './player'

class ComputerPlayer < Player
  def name
    @name = "HAL 9000"
  end

  def place_ships(array)
    ship_number = 0
    while (ship_number < array.length)
      ship_length = array[ship_number]
      y_coordinate_options = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
      coordinates = "#{y_coordinate_options.sample}#{rand(1..10)}"
      direction = rand(2) == 1
      ship_number +=1 if @grid.place_ship(Ship.new(ship_length), grid.x_of(coordinates), grid.y_of(coordinates), direction)
    end
    puts "HAL 9000 has placed its ships.\n"
  end


end
