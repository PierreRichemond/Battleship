require_relative "../views/players_view.rb"
require_relative "../models/player.rb"
require "pry"

class PlayersController
  def initialize(player_1, player_2)
    @players_view = PlayersView.new
    @player = player_1 # will alternate later each turn with switch_player method below
    @player_1 = player_1
    @player_2 = player_2

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
    @players_view.display_map_with_previous_hits(@shots, @hits)
    @point_of_origin = @players_view.ask_for(hit_location)
    @player.grid.add_hit(location)
    @players_view.result # if true say you touch something, if false, Plouf
  end

  def check_targeted_location # received on your board
    @players_view.display_map_with_previous_hits(@player.has_been_shot, @player.has_been_hit)
    @point_of_origin = @players_view.ask_for(hit_location)
    @player.grid.boats_state # if true say you touch something, if false, Plouf

  end

  def my_boats_states # check if your boats are damaged
    my_boats = @player.grid.my_boats_states # return an array like this [[boat1 true or false][boat2 true or false for each pins]]
    @players_view.display_boats_status(my_boats)
  end

  def switch_player
    if @player == @player_2
      @player = @player_1
    else
      @player = @player_2
    end
  end

  def player_name
    @player.name
  end
end
