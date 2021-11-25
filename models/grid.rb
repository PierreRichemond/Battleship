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
  def point_of_origin(x, y)
    @grid[x][y]
  end

  def can_position?(point_of_origin, position, size)
    if @grid.includes?(point_of_origin)
      origin = @grid[point_of_origin[1], point_of_origin[0]]
      positions = []
      case position

        when 1 then size.times do |i|               # going up
          positions << @grid[i][point_of_origin[1]]
          @grid[positions.last].present? ? true : false
        end

        when 2 then size.times do |i|               # going bottom
          positions << @grid[-i][point_of_origin[1]]
          @grid[positions.last].present? ? true : false
        end

        when 3 then size.times do |i|
          positions << @grid[point_of_origin[0][i]]
          @grid[positions.last].present? ? true : false
        end                                       #going right

        when 4 then size.times do |i|
          positions << @grid[point_of_origin[0][-i]]
          @grid[positions.last].present? ? true : false
        end                                         #going left
        else
          puts "Please press 1, 2, 3, 4"
      end
    else
      false
    end
  end

  def set_boat_1x4(point_of_origin, position)
    case position
      when 1 then 4.times  { |i| @boat_1x4 << @grid[i][point_of_origin[1]] } #going up
      when 2 then 4.times  { |i| @boat_1x4 << @grid[-i][point_of_origin[1]] }# going bottom
      when 3 then 4.times  { |i| @boat_1x4 << @grid[point_of_origin[0][i]] }#going right
      when 4 then 4.times  { |i| @boat_1x4 << @grid[point_of_origin[0][-i]] }#going left
    end
  end

  def set_boat_1x3(point_of_origin, position)
        case position
      when 1 then 3.times  { |i| @boat_1x3 << @grid[i][point_of_origin[1]] } #going up
      when 2 then 3.times  { |i| @boat_1x3 << @grid[-i][point_of_origin[1]] }# going bottom
      when 3 then 3.times  { |i| @boat_1x3 << @grid[point_of_origin[0][i]] }#going right
      when 4 then 3.times  { |i| @boat_1x3 << @grid[point_of_origin[0][-i]] }#going left
    end
  end

  def boats_state
    #true if you touch something
  end
  def add_hit(x, y)


  end

end
