require_relative "../views/players_view.rb"
require_relative "../models/player.rb"
require_relative "../models/grid.rb"

class PlayersController
  def initialize
    @players_view = PlayersView.new
    @grid_player_1 = Grid.new
    @player_1 = Player.new(grid_player_1)
    @grid_player_2 = Grid.new
    @player_2 = Player.new(grid_player_2)
    @p_1_boat_1x4 = @grid_player_1.boat_1x4
    @p_1_boat_1x3 = @grid_player_1.boat_1x3
    @p_2_boat_1x4 = @grid_player_2.boat_1x4
    @p_2_boat_1x3 = @grid_player_2.boat_1x3
    @shots = [] # shot current_player aim on the ennemy board
    @hits = []
    @has_been_shot = [] # passive hit, received on your board
    @has_been_hit = []
  end

  def place_your_boats
    @players_view.display_map
    x = @players_view.x - 1 # player select 1 but it's actually index 0
    y = @players_view.y - 1 #
    @point_of_origin = [x, y] # create the Point of origin with the coordinates
    @direction = @players_view.ask_for(direction) #right, left, up, bottom
    boolean = grid.can_position(@point_of_origin, @direction) # check if the boat has enough room
                                                              # to go on the specific direction
    @players_view.can_position(boolean) # let the user know if he can put it there
                                        # and give hime the locations of his boat with coordinates
  end

  def target_location # aim on the ennemy board
    @players_view.display_map_with_previous_hits(@shots, @hits)
    @point_of_origin = @players_view.ask_for(hit_location)
    @players_view.result # if true say you touch something, if false, Plouf
  end

  def targeted_location # received on your board
    @players_view.display_map_with_previous_hits(@has_been_shot, @has_been_hit)
    @point_of_origin = @players_view.ask_for(hit_location)
    if player_1.current_user
      @players_view.boats_state(@p_1_boat_1x4, @p_1_boat_1x3) # if true say you touch something, if false, Plouf
    else
      @players_view.boats_state(@p_2_boat_1x4, @p_2_boat_1x3) # if true say you touch something, if false, Plouf
    end
  end

  def my_boats_states # check if your boats are damaged
    if player_1.current_user
      @grid_player_1.my_boats_states(@p_1_boat_1x4, @p_1_boat_1x3)
    else
      @grid_player_1.my_boats_states(@p_2_boat_1x4, @p_2_boat_1x3) # if true say you touch something, if false, Plouf
    end
    @players_view.display_map_with_previous_hits(@shots, @hits)
    @point_of_origin = @players_view.ask_for(hit_location)
    @players_view.result # if true say you touch something, if false, Plouf
  end
end
