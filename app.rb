require_relative "controllers/players_controller.rb"
require_relative "models/player.rb"

class App
  def initialize
    @player_1 = Player.new
    @player_2 = Player.new
    @controller = PlayersController.new(@player_1, @player_2)
    @running = true
    run
  end

  def run
    puts "Welcome to the Boat war!"
    puts "This is a 2 players game."
    puts "Place your 2 boats on the board (4x1 and 3x1)."
    puts "Horizontal or vertical position only."
    puts "
           ＿＿0＿＿1＿＿＿2＿＿3＿＿＿4＿
        0 |   。　　。　　。　　。　　。　｜
        1 |   。　　。　　。　　。　　。　｜
        2 |   。　　。　　。　　。　　。　｜
        3 |   。　　。　　。　　。　　。　｜
        4 |   。　　。　　。　　。　　。　｜
        　｜＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿ ｜"
    puts "Players will switch turns."
    puts "Try to touch your opponent's boat then sink it before he/she sinks yours."
    puts "Good luck & Have fun."
    puts "           --           "
    puts "Enter the name of the first player"
    @player_1.name = gets.chomp
    puts "Enter the name of the second player"
    @player_2.name = gets.chomp

    puts "#{@player_1.name}, place your boats"
    @controller.place_your_boats

    puts "#{@player_2.name}, place your boats."
    @controller.place_your_boats

    while @running
      puts "Your turn #{@controller.player_name}"
      display_tasks
      action = gets.chomp.to_i
      route_action(action)
      if action == 1
        if @controller.win?
          puts ''
           puts "CONGRATULATION #{@controller.player_name}, YOU WIN !"
          display_options
          choice = gets.chomp.to_i
          play_again(choice) # or quit
        end
        @controller.switch_players
      end
    end

  end

  private

  def stop
    @running = false
  end

  def route_action(action)
    case action
    when 1 then @controller.target_a_location
    when 6 then stop
    else
      puts "Please press 1 or 6"
    end
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - Target a location, also display where you previously hit"
    puts "6 - Stop and exit the program"
  end

  def play_again(action)
    case action
      when 1 then run
      when 6 then stop
    else
      puts "Please press 1 or 6"
    end
  end

  def display_options
    puts ""
    puts "What do you want to do next?"
    puts "1 - Play again"
    puts "6 - Stop and exit the program"
  end
end
App.new
