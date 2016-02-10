class Grid
  attr_reader :ships, :ready_grid, :used_grid

  def initialize
    @ships = []
    # @fired_at = false
    # @ready_grid = ""
  end

  def has_ship_on?(x,y)
    @ships.each do |s|
      return s if s.covers?(x,y)
    end
    false
  end

  def place_ship(ship, x, y, across)
    ship.place(x, y, across)
    @ships.each do |s|
      return false if s.overlaps_with?(ship)
    end
    @ships << ship
  end


  def display
    table_header
    display_line
    ("A".."J").each_with_index do |l, i|
      row = "  |   |   |   |   |   |   |   |   |   |   |"
      y = i+1
      row[0] = l
        (1..10).each do |x|
        ship_exists = has_ship_on?(x,y)
          if ship_exists && ship_exists.fire_at(x,y)
            row[x + (x * 3)] = "X"
          elsif ship_exists
            row[x + (x * 3)] = "O"
          end
      # else
      #   (1..10).each do |x|
      #     if has_ship_on?(x,y)
      #       row[x + (x * 3)] = "O"
        end
        # end
      # end
      puts row
    end
    display_line
  end

  def fire_at(x,y)
    ship = has_ship_on?(x,y)
    if ship
      ship.fire_at(x,y)
      return true
    end
    false
  end



  def empty_grid
      %Q{    1   2   3   4   5   6   7   8   9   10
    -----------------------------------------
    A |   |   |   |   |   |   |   |   |   |   |
    B |   |   |   |   |   |   |   |   |   |   |
    C |   |   |   |   |   |   |   |   |   |   |
    D |   |   |   |   |   |   |   |   |   |   |
    E |   |   |   |   |   |   |   |   |   |   |
    F |   |   |   |   |   |   |   |   |   |   |
    G |   |   |   |   |   |   |   |   |   |   |
    H |   |   |   |   |   |   |   |   |   |   |
    I |   |   |   |   |   |   |   |   |   |   |
    J |   |   |   |   |   |   |   |   |   |   |
    -----------------------------------------
    }
  end

  private def display_line
    puts "  -----------------------------------------"
  end

  private def table_header
    puts "    1   2   3   4   5   6   7   8   9   10"
  end



end
