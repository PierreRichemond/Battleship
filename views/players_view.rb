require "pry"

class PlayersView
  def y
        puts "Get the vertical location, select a number on the top from 0 to 4"
        gets.chomp

  end

  def x
    puts "Get the Horizontal location, select a number on the left from 0 to 4"
    gets.chomp
  end

  def ask_for(something)
    puts "What is the #{something}?"
    gets.chomp
  end

  def set_boat(size)
    puts "Select the point from you will place your boat, you will be asked for a direction later"
    puts "set up the boat size 1 by #{size}"
  end

  def ask_for_position
    puts "What is the direction from the point of origin?"
    puts "1 - Up"
    puts "2 - Bot"
    puts "3 - Right"
    puts "4 - Left"
    gets.chomp
  end

  def turn(name)
    puts "#{name}'s turn!"
  end

  def does_boat_can_be_placed(boolean)
    if boolean
      puts "👏 Your boat is on the board"
    else
      puts "❌ Change the position of the boat"
    end
  end

  def display_boats_status(array_of_boats)
    array_of_boats.each do |boat|
      p "Boat size: 1 x #{boat.size}"
      puts "#{boat}"
    end
  end

  def display_map
    puts "
           ＿＿0＿＿1＿＿ 2＿＿3＿＿ 4＿
        0 |   。　　。　　。　　。　　。　｜
        1 |   。　　。　　。　　。　　。　｜
        2 |   。　　。　　。　　。　　。　｜
        3 |   。　　。　　。　　。　　。　｜
        4 |   。　　。　　。　　。　　。　｜
        　｜＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿ ｜"
  end

  def result(location, shots, hit_by_location, boats)
    puts ""
    puts "targeted location :#{location}"
    puts "Where I Shot before:"
    puts "#{shots}"
    puts "Where I Hit Opponent's boat:"
    puts "#{hit_by_location}"
    puts "your boats location"
    puts "#{boats}"
    puts ""
  end

  def target
    puts "Target one spot on the grid"
  end
end
