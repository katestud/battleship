class Game

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @players = [@player_one, @player_two]
    @turns = 0
  end

  def welcome
    puts "Welcome, #{@player_one.name} and #{@player_two.name}!\nIt's time to play Battleship.\n"
  end

  def place_ships
    @player_one.place_ships
    @player_two.place_ships
  end

  def display_status
    if @turns == 0
      puts "SHOTS TAKEN:"
      puts Grid::EMPTYGRID
      puts "\nYOUR BOARD:"
      @players[0].grid.display
    else
      puts "SHOTS TAKEN:"
      @players[1].grid.display_shots
      puts "\nYOUR BOARD:"
      @players[0].grid.display
    end
  end


  def x_of(string)
    string[1..-1].to_i
  end

  def y_of(string)
    ("A".."J").each_with_index do |l, i|
      if string[0] == l
        return i + 1
      end
    end
  end

  def take_turn
    player_one = @players[0]
    player_two = @players[1]
    coordinates = player_one.call_shot
    if player_two.grid.fire_at(x_of(coordinates), y_of(coordinates))
      puts "Hit!"
      player_two.grid.fired_at << [x_of(coordinates), y_of(coordinates)]
    else
      puts "Miss!"
      player_two.grid.missed << [x_of(coordinates), y_of(coordinates)]
    end
    @turns =+ 1
    @players.reverse!
  end
end
