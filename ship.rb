require './position.rb'
require 'byebug'

class Ship
  attr_reader :length, :x_coordinate, :y_coordinate, :ship_pegs

  def initialize(length)
    @length = length
    @direct_hits = []
  end

  def place(x_coordinate, y_coordinate, across = true)
    return false if @placed
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @across = across
    ship_pegs = []
    if @across
      ship_pegs << Position.new(@x_coordinate, @y_coordinate)
      ship_end = x_coordinate + @length
      starting_x_coordinate = x_coordinate
      until starting_x_coordinate == ship_end
        ship_pegs << Position.new(starting_x_coordinate, @y_coordinate)
        starting_x_coordinate += 1
      end
    else
      ship_pegs << Position.new(@x_coordinate, @y_coordinate)
      ship_end = y_coordinate + @length
      starting_y_coordinate = y_coordinate
      until starting_y_coordinate == ship_end
        ship_pegs << Position.new(@x_coordinate, starting_y_coordinate)
        starting_y_coordinate +=1
      end
    end
    @placed = true
    @ship_pegs = ship_pegs
  end

  def covers?(x_coordinate, y_coordinate)
    ship_pegs.each do |position|
      return true if position.x_coordinate == x_coordinate && position.y_coordinate == y_coordinate
    end
    false
  end

  def overlaps_with?(other)
    ship_pegs.each do |position|
      return true if other.covers?(position.x_coordinate, position.y_coordinate)
    end
    false
  end

  def fire_at(x_coordinate, y_coordinate)
    @direct_hits.each do |position|
      past_hit = (position.x_coordinate == x_coordinate) && (position.y_coordinate == y_coordinate)
      return false if past_hit
    end
    if covers?(x_coordinate, y_coordinate)
      @direct_hits << Position.new(x_coordinate, y_coordinate)
      return true
    else
      @direct_hits << Position.new(x_coordinate, y_coordinate)
      return false
    end
  end

end
