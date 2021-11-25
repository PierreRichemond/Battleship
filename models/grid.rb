class Grid
  # X = [1, 2 ,3 ,4 ,5]
  # Y = [1, 2 ,3 ,4 ,5]
  @boat_1x4 = []
  @boat_1x3 = []
  # grid = [
  #   [[1, 1], [1, 2], [1, 3], [1, 4], [1, 5]],
  #   [[2, 1], [2, 2], [2, 3], [2, 4], [2, 5]],
  #   [[3, 1], [3, 2], [3, 3], [3, 4], [3, 5]],
  #   [[4, 1], [4, 2], [4, 3], [4, 4], [4, 5]],
  #   [[5, 1], [5, 2], [5, 3], [5, 4], [5, 5]]
  # ]
        #    ___1____2____3____4____5___
        # 1 |   。　　。 true　true　true |
        # 2 |  true　　。　　。　　。　　。 ｜
        # 3 |  true　　。　　。　　。　　。 ｜
        # 4 |  true　　。　　。　　。　　。 ｜
        # 5 |  true　　。　　。　　。　　。 ｜
        # 　｜＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿ ｜
  @grid = [
    [false, false, false, false, false],
    [false, false, false, false, false],
    [false, false, false, false, false],
    [false, false, false, false, false],
    [false, false, false, false, false]
  ]

  def can_position?(point_of_origin, direction, size)
    if @grid.includes?(point_of_origin)
      positions = [] #list of each points of a single boat
      case direction
        when 1 then size.times { |i| positions << @grid[point_of_origin[0] + i][point_of_origin[1]] } #going up
        when 2 then size.times { |i| positions << @grid[point_of_origin[0] - i][point_of_origin[1]] } #going bottom
        when 3 then size.times { |i| positions << @grid[point_of_origin[0][point_of_origin[1] + i]] } #going right
        when 4 then size.times { |i| positions << @grid[point_of_origin[0][point_of_origin[1] - i]] } #going left
        overlap = overlap?(positions)
        if @grid[positions.last].present? && !overlap #check if the coordinates are valid and if it overlaps another boat
          true # can position ok
        else
          false # can't position
        end
      else
        puts "Please press 1, 2, 3, 4"
      end
    else
      false# can't position
    end
  end

  def set_boat_1x4(point_of_origin, direction)
    case direction
      when 1 then 4.times { |i| @boat_1x4 << @grid[point_of_origin[0] + i][point_of_origin[1]] } #going up
      when 2 then 4.times { |i| @boat_1x4 << @grid[point_of_origin[0] - i][point_of_origin[1]] } #going bottom
      when 3 then 4.times { |i| @boat_1x4 << @grid[point_of_origin[0][point_of_origin[1] + i]] } #going right
      when 4 then 4.times { |i| @boat_1x4 << @grid[point_of_origin[0][point_of_origin[1] - i]] } #going left
    end
    @boat_1x4
  end

  def set_boat_1x3(point_of_origin, direction)
    case direction
      when 1 then 3.times  { |i| @boat_1x3 << @grid[point_of_origin[0] + i][point_of_origin[1]] } #going up
      when 2 then 3.times  { |i| @boat_1x3 << @grid[point_of_origin[0] - i][point_of_origin[1]] } #going bottom
      when 3 then 3.times  { |i| @boat_1x3 << @grid[point_of_origin[0][point_of_origin[1] + i]] } #going right
      when 4 then 3.times  { |i| @boat_1x3 << @grid[point_of_origin[0][point_of_origin[1] - i]] } #going left
    end
    @boat_1x3
  end

  def overlap?(array_of_pins) # check if the second boat you overlaps the first
    # return true if overlap
  end

  def boats_state
    #true if you touch something
  end
  def add_hit(hit_point) #hit_point is an array like this [1, 3]
  end
end
