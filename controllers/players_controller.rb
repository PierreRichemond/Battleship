require_relative "../views/players_view.rb"
require_relative "../models/player.rb"
require "pry"

class PlayersController
  def initialize(player_1, player_2)
    @players_view = PlayersView.new
    @player = player_1 # will alternate later each turn with switch_player method below
    @opponent = player_2
  end

  def place_your_boats
    place_your_boat(3)
    place_your_boat(4)
    @players_view.display_boats_status(@player.boats)
    @players_view.turn(@player.name)
  end

  def place_your_boat(length)
    @players_view.display_map
    @players_view.set_boat("1 x #{length}")
    y = @players_view.y.to_i - 1 # player select 1 but it's actually index 0
    x = @players_view.x.to_i - 1 #
    if (y.negative? || x.negative?) || (y >= 5 || x >= 5)
      puts "Point of origin Out of bounds"
      place_your_boat(length)
    end
    point_of_origin = [y, x] # create the Point of origin with the coordinates
    direction = @players_view.ask_for_position.to_i #right, left, up, bottom
    boat_can_be_placed = @player.does_boat_can_be_placed?(point_of_origin, direction, length) # check if the boat has enough room
                                                              # to go on the specific direction
    @players_view.does_boat_can_be_placed(boat_can_be_placed) # let the user know if he can put it there
    if boat_can_be_placed  # and give hime the locations of his boat with coordinates
      @player.set_boat(point_of_origin, direction, length)# set boat on the board, turn false positions to true
    else
      place_your_boat(length) # recursion
    end
  end

  def target_a_location # aim on the ennemy board
    @players_view.target # where i aimed, where i hit
    y = @players_view.y.to_i - 1 # player select 1 but it's actually index 0
    x = @players_view.x.to_i - 1 #
    if (y.negative? || x.negative?) || (y >= 5 || x >= 5)
      puts "Point of origin Out of bounds"
      target_a_location
    end
    location = [y, x]
    @player.shot(location)
    @players_view.result # if true say you touch something, if false, Plouf
  end

  def check_targeted_location
    boats_location = @player.boats
    shots = @opponent.shots
    boat_states = @player.my_boats_states
    players_view.display_map_with_previous_hits(boats_location, shots, boat_states)
  end

  def my_boats_states # check if your boats are damaged
    my_boats = @player.my_boats_states #
    @players_view.display_boats_status(my_boats)
  end

  def switch_player # method called on the app.rb
    if @player == @player_2
      @player = @player_1
    else
      @player = @player_2
    end
  end

  def switch_opponent
    if @opponent == @player_1
      @opponent = @player_2
    else
      @opponent = @player_1
    end
  end

  def player_name
    @player.name # unnecessary, attribute on player name already
  end

  def win?
    count = 0
    if @opponent.boats.present?
      @opponent.boats.each do |boat|
        boat.each do |location| #[1, 2]
          @player.shots.each do |shot| #[1, 2]
            count += 1 if shot == location #compare player shots location with the opponent boat's location
          end
        end
      end
    end
    @player.win = true if count == 7
    true
  end
end
