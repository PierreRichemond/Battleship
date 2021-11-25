require_relative "controllers/players_controller.rb"

class App
  def initialize
    @controller = PlayersController.new
    @running = true
    run
  end

  def run
    puts "Welcome to the Boat war!"
    puts "This is a 2 players game."
    puts "Place your 2 boats on the board (4x1 and 3x1)."
    puts "Horizontal or vertical position only."
     puts "
          　___1____2____3____4___5___
        1 |   。　　。　　。　　。　　。　｜
        2 |   。　　。　　。　　。　　。　｜
        3 |   。　　。　　。　　。　　。　｜
        4 |   。　　。　　。　　。　　。　｜
        5 |   。　　。　　。　　。　　。　｜
        　｜＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿ ｜"
    puts "Players will switch turns."
    puts "Try to touch your opponent's boat then sink it before he/she sinks yours."
    puts "Good luck & Have fun."
    puts "           --           "

    while @running
      @current_user = @sessions_controller.log_in
      while @current_user
        display_tasks
        action = gets.chomp.to_i
        route_action(action)
      end
    end
  end

  private

  def stop
    @running = false
  end

  def route_action(action)
    case action
    when 1 then controller.place_your_boats
    when 2 then controller.target_location
    when 3 then controller.targeted_location
    when 4 then controller.my_boats_states

    when 0 then stop
    else
      puts "Please press 1, 2, 3, 4 or 0"
    end
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - Place your boats"
    puts "2 - Target a location"
    puts "3 - Check where you opponent targeted"
    puts "4 - Check the state of your boats"

    puts "0 - Stop and exit the program"
  end
end
