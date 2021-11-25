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
end
