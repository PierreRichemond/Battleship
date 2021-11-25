require_relative "controllers/players_controller.rb"
require_relative "models/grid.rb"
require_relative "models/player.rb"

class App
  def initialize
    @grid_player_1 = Grid.new
    @player_1 = Player.new(@grid_player_1)
    @grid_player_2 = Grid.new
    @player_2 = Player.new(@grid_player_2)
    @player = @player_1
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
           ＿＿1＿＿2＿＿＿3＿＿4＿＿＿5＿
        1 |   。　　。　　。　　。　　。　｜
        2 |   。　　。　　。　　。　　。　｜
        3 |   。　　。　　。　　。　　。　｜
        4 |   。　　。　　。　　。　　。　｜
        5 |   。　　。　　。　　。　　。　｜
        　｜＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿｜"
    puts "Players will switch turns."
    puts "Try to touch your opponent's boat then sink it before he/she sinks yours."
    puts "Good luck & Have fun."
    puts "           --           "

    while @running
        display_tasks
        action = gets.chomp.to_i
        route_action(action)
        if action == 1 || action == 2
          switch_player
        end
    end
  end

  private

  def switch_player
    if @player == @grid_player_2
      @player = @grid_player_1
    else
      @player = @grid_player_2
    end
  end

  def stop
    @running = false
  end

  def route_action(action)
    case action
    when 1 then @controller.place_your_boats
    when 2 then @controller.target_location
    when 3 then @controller.targeted_location
    when 4 then @controller.my_boats_states

    when 0 then stop
    else
      puts "Please press 1, 2, 3, 4 or 0"
    end
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - Place your boats"
    puts "2 - Target a location, also display where you previously hit"
    puts "3 - Check where you opponent targeted"
    puts "4 - Check the state of your boats"

    puts "0 - Stop and exit the program"
  end
end

App.new
