require "pry"

class Player
  attr_accessor :name
  attr_reader :boats, :grid, :shots, :win, :hit_by_location

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
    @shots = attributes[:shots]
    @shots = []
    @win = attributes[:win]
    @win = false
    @hit_by_location = attributes[:hit_by_location]
    @hit_by_location = []
  end

        #    ___1____2____3____4____5___
        # 1 |   。　　。 true　true　true |
        # 2 |  true　。　　。　　。　　。  ｜
        # 3 |  true　。　　。　　。　　。  ｜
        # 4 |  true　。　　。　　。　　。  ｜
        # 5 |  true　。　　。　　。　　。  ｜
        # 　｜＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿ ｜

  def does_boat_can_be_placed?(point_of_origin, direction, length)
    if !@grid[point_of_origin[0]][point_of_origin[1]].nil? # grid[1][6] = nil  [-5 ==> -1] nil
      positions = [] #list of each points of a single boat
      case direction
        when 1 then length.times { |i| positions << [[point_of_origin[0] - i], [point_of_origin[1]]].flatten } #going up
        when 2 then length.times { |i| positions << [[point_of_origin[0] + i], [point_of_origin[1]]].flatten } #going bottom
        when 3 then length.times { |i| positions << [[point_of_origin[0], [point_of_origin[1] + i]]].flatten } #going right
        when 4 then length.times { |i| positions << [[point_of_origin[0], [point_of_origin[1] - i]]].flatten } #going left
        else
        puts "Please press 1, 2, 3, 4"
      end
      boat_overlap = boat_overlap?(positions) # return true if boat overlaps an other one or is out of bound
      boat = []
      print positions
      positions.each do |locations|
        if !@grid[locations[0]][locations[1]].nil? && !boat_overlap #check if the coordinates are valid and if it overlaps another boat
          boat << true # case is true when doesnt overlap
        else
          boat << false
        end
      end
      boat.uniq.length == 1 && boat[0] == true
    else
      puts "Try again, Place your boat within the grid"
    end
  end

  def boat_overlap?(boat_pins)
    boat_pins.each do |locations| # boat_pins = [[1,2], [1, 3], [1, 4]]
      return true if locations[0].negative? || locations[1].negative? # out of bound
      position = @grid[locations[0]][locations[1]]
      return true if position.nil? # out of bounds
      return true if position == true # overlap check

    end
    false
  end

  def set_boat(point_of_origin, direction, length) # create boats position on the board
    boat = []
    case direction
      when 1 then length.times { |i| boat << [[point_of_origin[0] - i], [point_of_origin[1]]].flatten } #going up
      when 2 then length.times { |i| boat << [[point_of_origin[0] + i], [point_of_origin[1]]].flatten } #going bottom
      when 3 then length.times { |i| boat << [[point_of_origin[0], [point_of_origin[1] + i]]].flatten } #going right
      when 4 then length.times { |i| boat << [[point_of_origin[0], [point_of_origin[1] - i]]].flatten } #going left
    end
    set_up_boats_on_grid(boat) # place boat on the board
    @boats << boat
  end

  def set_up_boats_on_grid(boat_pins)# turn the false to true on the board where
    boat_pins.each do |locations| # place boat on the board
      @grid[locations[0]][locations[1]] = true
    end
  end

  def shot(location) #store the position the player attacks
    @shots << location
  end

  def hit_or_sink(location) #tells after shoting weither a boat is hit or sunk
    state = "Hit the water :("
    @boats.each do |boat|
      boat.each_with_index do |spot, index|
        if spot == location
          boat[index] = "Hit!"
          state = "Hit!"
          @hit_by_location << spot
        end
        state = "~~~~~ Yeah, Sinked one boat !!!!!" if boat.select {|is_hit| is_hit == "Hit!"}.length == boat.length
      end
    end
    state
  end
end
