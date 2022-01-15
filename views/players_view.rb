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
    display_map(array_of_boats)
    array_of_boats.each do |boat|
      p "Boat size: 1 x #{boat.size}"
      puts "#{boat}"
    end
  end

  def display_map(boats)
    arr = [
      ['。', '。', '。', '。', '。'],
      ['。', '。', '。', '。', '。'],
      ['。', '。', '。', '。', '。'],
      ['。', '。', '。', '。', '。'],
      ['。', '。', '。', '。', '。']
    ]
    boats.each { |boat| boat.each { |pos| arr[pos.first][pos.last] = ' x'  if pos != 'Hit!' } }
    puts " my boats positions
           ＿＿0＿＿1＿＿ 2＿＿3＿＿ 4＿
        0 |   #{arr[0][0]}　　#{arr[0][1]}　　#{arr[0][2]}　　#{arr[0][3]}　　#{arr[0][4]}　｜
        1 |   #{arr[1][0]}　　#{arr[1][1]}　　#{arr[1][2]}　　#{arr[1][3]}　　#{arr[1][4]}　｜
        2 |   #{arr[2][0]}　　#{arr[2][1]}　　#{arr[2][2]}　　#{arr[2][3]}　　#{arr[2][4]}　｜
        3 |   #{arr[3][0]}　　#{arr[3][1]}　　#{arr[3][2]}　　#{arr[3][3]}　　#{arr[3][4]}　｜
        4 |   #{arr[4][0]}　　#{arr[4][1]}　　#{arr[4][2]}　　#{arr[4][3]}　　#{arr[4][4]}　｜
        　｜＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿ ｜"
  end

  def result(location, shots, hit_by_location, boats)
    puts ""
    puts "targeted location :#{location}"
    puts "Where I Shot before:"
    where_I_previously_shot(shots, hit_by_location)
    display_map(boats)
    puts ""
  end

  def where_I_previously_shot(shots, hit_by_location)
        arr = [
      ['。', '。', '。', '。', '。'],
      ['。', '。', '。', '。', '。'],
      ['。', '。', '。', '。', '。'],
      ['。', '。', '。', '。', '。'],
      ['。', '。', '。', '。', '。']
    ]
    shots.each { |shot| arr[shot.first][shot.last] = ' O' }
    hit_by_location.each { |hit| arr[hit.first][hit.last] = ' X' }
    puts "O = Hitting the water
          X = Hit a ship
           ＿＿0＿＿1＿＿ 2＿＿3＿＿ 4＿
        0 |   #{arr[0][0]}　　#{arr[0][1]}　　#{arr[0][2]}　　#{arr[0][3]}　　#{arr[0][4]}　｜
        1 |   #{arr[1][0]}　　#{arr[1][1]}　　#{arr[1][2]}　　#{arr[1][3]}　　#{arr[1][4]}　｜
        2 |   #{arr[2][0]}　　#{arr[2][1]}　　#{arr[2][2]}　　#{arr[2][3]}　　#{arr[2][4]}　｜
        3 |   #{arr[3][0]}　　#{arr[3][1]}　　#{arr[3][2]}　　#{arr[3][3]}　　#{arr[3][4]}　｜
        4 |   #{arr[4][0]}　　#{arr[4][1]}　　#{arr[4][2]}　　#{arr[4][3]}　　#{arr[4][4]}　｜
        　｜＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿ ｜"
  end

  def target
    puts "Target one spot on the grid"
  end
end
