require "pry"

class Player
  attr_accessor :name
  attr_reader :boats, :grid, :shots, :win

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
      print positions # print in the view, add a +1 to the index for better understanding on the board
      positions.each do |locations|
        if !@grid[locations[0]][locations[1]].nil? && !boat_overlap #check if the coordinates are valid and if it overlaps another boat
          boat << true   # if boat present, case is true so overlap true
        else
          boat << false
        end
      end
      boat.length != 1 && boat.uniq.length == 1 && boat[0] == true
      # boat.length != 1 useless
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
    end # refacto array instead of flatten   [point_of_origin[0] - i, point_of_origin[1]]
    set_up_boats_on_grid(boat)
    @boats << boat
  end

  def boat_overlap?(boat_pins)
    boat_pins.each do |locations| # boat_pins = [[1,2], [1, 3], [1, 4]]
      return true if locations[0].negative? || locations[1].negative? # out of bound

      position = @grid[locations[0]][locations[1]]
      return true if position.nil? # out of bounds
      return true if position == true # overlap check
    end
    false                            # need the opposite for overlap
  end

  def set_up_boats_on_grid(boat_pins)# turn the false to true on the board where
    boat_pins.each do |locations|
      locations.each do |location|
        @grid[location[0]][location[1]] = true
      end
    end
  end

  def my_boats_states
    #tells the user if his boats are intact / damaged / sinked
    boats = [] # //["hit, sinked"]
    @boats.each do |boat|
      matches = []

      shots.each do |shot|
        matches << false if @grid[shot[0]][shot[1]] == false
        if @grid[shot[0]][shot[1]] == true
          boats << "hit on #{shot}"
          matches << true
        end
      end
      boats << 'sink' if matches.uniq.length == 1 && matches[0] == true
      boats << 'intact' if matches.uniq.length == 1 && matches[0] == false
    end
    # return ["hit, sinked"]
    boats
  end

  def shot(location) #attack
    @shots << location
  end
end
