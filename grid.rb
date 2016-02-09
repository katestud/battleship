class Grid
  attr_reader :ships



  def display
  puts "    1   2   3   4   5   6   7   8   9   10"
  display_line
  ("A".."J").each do |l|
    puts l + " |   |   |   |   |   |   |   |   |   |   |"
  end
  display_line
end

private def display_line
  puts "  -----------------------------------------"
end

end
