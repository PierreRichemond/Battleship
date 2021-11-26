require "pry"

class PlayersView
  def y
    puts "Select the point from you will place your boat, you will be asked for a direction later"
        puts "Get the vertical location, select a number on the top from 1 to 5"
        gets.chomp
  end

  def x
    puts "Get the Horizontal location, select a number on the left from 1 to 5"
    gets.chomp
  end

  def ask_for(something)
    puts "What is the #{something}?"
    gets.chomp
  end

  def set_boat(size)
    puts "set up the boat de size 1 by #{size}"
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
      puts "boat-size: 1 x #{boat.size}"
      text = boat.each do |location| #true or false
        location ? "-damaged-" : "-undamaged-"
      end
      print text
    end
  end

  def display_map
    puts "
           ＿＿1＿＿2＿＿ 3＿＿4＿＿ 5＿
        1 |   。　　。　　。　　。　　。　｜
        2 |   。　　。　　。　　。　　。　｜
        3 |   。　　。　　。　　。　　。　｜
        4 |   。　　。　　。　　。　　。　｜
        5 |   。　　。　　。　　。　　。　｜
        　｜＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿ ｜"
  end

  def display_map_with_previous_hits(has_been_shot, has_been_hit)
    display_map

  end
end
