class View
  def x
    puts "Select the point from you will place your boat, you will be asked for a direction later"
    puts "
            ___1____2____3____4___5___
        1 |   。　　。　　。　　。　　。　｜
        2 |   。　　。　　。　　。　　。　｜
        3 |   。　　。　　。　　。　　。　｜
        4 |   。　　。　　。　　。　　。　｜
        5 |   。　　。　　。　　。　　。　｜
        　｜＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿ ｜"
        puts "first get the horizontal location, select a number on the top from 1 to 5"
        gets.chomp
  end

  def y
        puts "then get the vertical location, select a number on the left from 1 to 5"
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
    puts "2 - Bottom"
    puts "3 - Right"
    puts "4 - Left"
    gets.chomp
  end

  def can_position(boolean)
    if boolean
      puts "👏 Your boat is on the board"
    else
      puts "❌ Change the position of the boat"
    end
  end
end
