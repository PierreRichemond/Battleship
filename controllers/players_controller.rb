require_relative "../views/players_view.rb"
require_relative "../models/player.rb"
require "pry"

class PlayersController
  def initialize(player_1, player_2)
    @player1 = player_1
    @player2 = player_2
    @players_view = PlayersView.new
    @player = @player1 # will alternate later each turn with switch_player method below
    @opponent = @player2
  end

  def place_your_boats
    place_your_boat(3)
    place_your_boat(4)
    @players_view.display_boats_status(@player.boats)
    @players_view.turn(@opponent.name)
    switch_players
  end

  def place_your_boat(length)
    @players_view.display_map
    @players_view.set_boat("1 x #{length}")
    y = @players_view.y.to_i # player select 1 but it's actually index 0
    x = @players_view.x.to_i
    if (y.negative? || x.negative?) || (y >= 5 || x >= 5)
      puts "Point of origin Out of bounds"
      place_your_boat(length)
    end
    point_of_origin = [y, x] # create the Point of origin with the coordinates
    direction = @players_view.ask_for_position.to_i #right, left, up, bottom                                                       # to go on the specific direction
    boat_can_be_placed = @player.does_boat_can_be_placed?(point_of_origin, direction, length) # check if the boat has enough room
    @players_view.does_boat_can_be_placed(boat_can_be_placed) # let the user know if he can put it there
    if boat_can_be_placed # and give hime the locations of his boat with coordinates
      @player.set_boat(point_of_origin, direction, length)# set boat on the board, turn false positions to true
    else
      place_your_boat(length) # recursion
    end
  end

  def target_a_location # aim on the ennemy board
    @players_view.target # where i aimed, where i hit
    y = @players_view.y.to_i # player select 1 but it's actually index 0
    x = @players_view.x.to_i #
    if (y.negative? || x.negative?) || (y >= 5 || x >= 5)
      puts "Point of origin Out of bounds"
      target_a_location
    end
    location = [y, x]
    @player.shot(location)
    hit_state = @opponent.hit_or_sink(location)
    puts hit_state
    @opponent.hit_by_location
    @players_view.result(location, @opponent.shots, @player.hit_by_location, @opponent.boats) # if true say you touch something, if false, Plouf
  end

  def switch_players # method called on the app.rb
    if @player == @player1
      @player = @player2
      @opponent = @player1
    else
      @player = @player1
      @opponent = @player2
    end
  end

  def player_name # called from the controller
    @player.name
  end

  def hit_by_location
    @player.boats
  end

  def win?
    count = 0
      @opponent.boats.each do |boat|
        boat.each do |location| #[1, 2]
          @player.shots.each do |shot| #[1, 2]
            count += 1 if shot == location #compare player shots location with the opponent boat's location
          end
        end
      end
    return true if count == 7
    false
  end
end
