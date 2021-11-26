require "pry"

class Player
  attr_accessor :name
  attr_reader :boats, :grid

  def initialize(attributes = {})
    @grid = attributes[:grid]
    @grid = [
    [false, false, false, false, false],
    [false, false, false, false, false],
    [false, false, false, false, false],
    [false, false, false, false, false],
    [false, false, false, false, false]
  ]
    @boats = attributes[:boats]
    @boats = []
    @name = attributes[:name]
    # @active = false
  end
  # grid = [
  #   [[1, 1], [1, 2], [1, 3], [1, 4], [1, 5]],
  #   [[2, 1], [2, 2], [2, 3], [2, 4], [2, 5]],
  #   [[3, 1], [3, 2], [3, 3], [3, 4], [3, 5]],
  #   [[4, 1], [4, 2], [4, 3], [4, 4], [4, 5]],
  #   [[5, 1], [5, 2], [5, 3], [5, 4], [5, 5]]
  # ]
        #    ___1____2____3____4____5___
        # 1 |   。　　。 true　true　true |
        # 2 |  true　。　　。　　。　　。  ｜
        # 3 |  true　。　　。　　。　　。  ｜
        # 4 |  true　。　　。　　。　　。  ｜
        # 5 |  true　。　　。　　。　　。  ｜
        # 　｜＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿ ｜

  def does_boat_can_be_placed?(point_of_origin, direction, length)
    if !@grid[point_of_origin[0]][point_of_origin[1]].nil?
      positions = [] #list of each points of a single boat
      case direction
        when 1 then length.times { |i| positions << [[point_of_origin[0] - i], [point_of_origin[1]]].flatten } #going up
        when 2 then length.times { |i| positions << [[point_of_origin[0] + i], [point_of_origin[1]]].flatten } #going bottom
        when 3 then length.times { |i| positions << [[point_of_origin[0], [point_of_origin[1] + i]]].flatten } #going right
        when 4 then length.times { |i| positions << [[point_of_origin[0], [point_of_origin[1] - i]]].flatten } #going left
      else
        puts "Please press 1, 2, 3, 4"
      end
      boat_overlap = boat_overlap?(positions)
      boat = []
      print positions
      positions.each do |locations|
        locations.each do |location|
          if !@grid[location[0]][location[1]].nil? && !boat_overlap #check if the coordinates are valid and if it overlaps another boat
            boat << true                                            # if boat present, case is true so overlap true
          else
            boat << false
          end
        end
      end
      boat.length != 1 && boat.uniq.length == 1 && boat[0] == true
    else
      puts "Try again, Place your boat within the grid"
    end
  end

  def set_boat(point_of_origin, direction, length)
    boat = []
    case direction
      when 1 then length.times { |i| boat << [[point_of_origin[0] - i], [point_of_origin[1]]].flatten } #going up
      when 2 then length.times { |i| boat << [[point_of_origin[0] + i], [point_of_origin[1]]].flatten } #going bottom
      when 3 then length.times { |i| boat << [[point_of_origin[0], [point_of_origin[1] + i]]].flatten } #going right
      when 4 then length.times { |i| boat << [[point_of_origin[0], [point_of_origin[1] - i]]].flatten } #going left
    end
    set_up_boats_on_grid(boat)
    @boats << boat
  end

  def boat_overlap?(array_of_locations_on_the_board)
    boat = []
    print "boat_overlap"
    array_of_locations_on_the_board.each do |locations|
      locations.each do |location|
        if @grid[location[0]][location[1]] == false # if true or nil / case doesn't exist like [0, 6]
          boat << false                             # if boat present, case is true so overlap true
        else
          boat << true
        end
      end
    end
    available_spots = boat.uniq.length == 1 && boat[0] == false #available_spots returns true for available condition
    !available_spots                                            # need the opposite for overlap
  end

  def set_up_boats_on_grid(array_of_locations_on_the_board)# turn the false to true on the board where
    array_of_locations_on_the_board.each do |locations|
      locations.each do |location|
        @grid[location[0]][location[1]] = true
      end
    end
  end

  def my_boats_states
    #true if you touch something
  end

  def add_hit(hit_point) #hit_point is an array like this [1, 3]

  end

  def has_been_shot
  end

  def has_been_hit
  end
end
