require "pry"

class Player
  attr_accessor :name, :grid, :boats
  attr_reader :shots, :win, :hit_by_location

  def initialize(attributes = {})
    @grid = attributes[:grid] || [
    [false, false, false, false, false],
    [false, false, false, false, false],
    [false, false, false, false, false],
    [false, false, false, false, false],
    [false, false, false, false, false]
  ]
    @boats = attributes[:boats] || []
    @name = attributes[:name]
    @shots = attributes[:shots]
    @shots = []
    @win = attributes[:win]
    @win = false
    @hit_by_location = attributes[:hit_by_location]
    @hit_by_location = []
  end

  def is_spot_available_on_the_grid?(point_of_origin, direction, length)
    if !@grid[point_of_origin[0]].nil? && !@grid[point_of_origin[0]][point_of_origin[1]].nil? # grid[1][6] = nil  [-5 ==> -1] nil
      positions = [] #list of each points of a single boat
      case direction
        when 1 then length.times { |i| positions << [[point_of_origin[0] - i], [point_of_origin[1]]].flatten } #going up
        when 2 then length.times { |i| positions << [[point_of_origin[0] + i], [point_of_origin[1]]].flatten } #going bottom
        when 3 then length.times { |i| positions << [[point_of_origin[0], [point_of_origin[1] + i]]].flatten } #going right
        when 4 then length.times { |i| positions << [[point_of_origin[0], [point_of_origin[1] - i]]].flatten } #going left
      end
      can_place_boat = can_place_boat?(positions) # return true if boat overlaps an other one or is out of bound
      boat = []
      positions.each do |locations|
        if !@grid[locations[0]][locations[1]].nil? && can_place_boat #check if the coordinates are valid and if it overlaps another boat
          boat << true # case is true when doesnt overlap
        else
          boat << false
        end
      end
      boat.all?(true)
    else
      false
    end
  end

  def can_place_boat?(boat_pins)
    list_of_condition = []
    boat_pins.each do |location| # boat_pins = [[1,2], [1, 3], [1, 4]]
      if !@grid[location[0]].nil? && !@grid[location[0]][location[1]].nil?
        list_of_condition << false if location[0].negative? || location[1].negative? # out of bound
        list_of_condition << false if location[0] >= 6 || location[1] >= 7
        position = @grid[location[0]][location[1]]
        position == false ? list_of_condition << true : list_of_condition << false  # overlap check
      else
        list_of_condition << false
      end
    end
    list_of_condition.all?(true)
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
    state = 'Hit the water :('
    @boats.each do |boat|
      boat.each_with_index do |spot, index|
        if location == spot
          boat[index] = "Hit!"
          @hit_by_location << spot
          state = "Hit!"
          return "Hit! ~~~~~ Yeah, Sinked one boat !!!!!" if boat.all?("Hit!")
        end
      end
    end
    state
  end
end
