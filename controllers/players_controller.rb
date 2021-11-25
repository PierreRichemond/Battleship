require_relative "../views/players_view.rb"
require_relative "../models/player.rb"
require_relative "../models/grid.rb"

class PlayersController
  def initialize(player_1, player_2)
    @players_view = PlayersView.new
    @player_1 = player_1
    @player_2 = player_2
    @player = Player.current_player
    @opponent = Player.opponent

    # @p_1_boat_1x4 = @player_1.grid.boat_1x4
    # @p_1_boat_1x3 = @player_1.grid.boat_1x3
    # @p_2_boat_1x4 = @player_2.grid.boat_1x4
    # @p_2_boat_1x3 = @player_2.grid.boat_1x3
    # @shots = [] # shot current_player aim on the ennemy board
    # @hits = []
    # @has_been_shot = [] # passive hit, received on your board
    # @has_been_hit = []
  end

  def place_your_boats
    place_your_boat(3)
    place_your_boat(4)
  end

  def place_your_boat(length)
    @players_view.display_map
    @players_view.set_boat("1 x #{length}")
    x = @players_view.x - 1 # player select 1 but it's actually index 0
    y = @players_view.y - 1 #
    point_of_origin = [x, y] # create the Point of origin with the coordinates
    direction = @players_view.ask_for(direction) #right, left, up, bottom
    boolean = grid.can_position?(point_of_origin, direction, length) # check if the boat has enough room
                                                              # to go on the specific direction
    if boolean
      @player.grid.set_boat_1xlength(point_of_origin, direction) # DOESN'T SEEMS TO WORK HERE !!!!
    end
    @players_view.can_position(boolean) # let the user know if he can put it there
                                        # and give hime the locations of his boat with coordinates
  end

  def target_location # aim on the ennemy board
    @players_view.display_map_with_previous_hits(@shots, @hits)
    @point_of_origin = @players_view.ask_for(hit_location)
    @player.grid.add_hit(location)
    @players_view.result # if true say you touch something, if false, Plouf
  end

  def check_targeted_location # received on your board
    @players_view.display_map_with_previous_hits(@has_been_shot, @has_been_hit)
    @point_of_origin = @players_view.ask_for(hit_location)
    @player.grid.boats_state # if true say you touch something, if false, Plouf
  end

  def my_boats_states # check if your boats are damaged
    if player_1.current_user
      @player.grid.my_boats_states

    @players_view.display_map_with_previous_hits(@shots, @hits)
    @point_of_origin = @players_view.ask_for(hit_location)
    @players_view.result # if true say you touch something, if false, Plouf
    end
  end

end
