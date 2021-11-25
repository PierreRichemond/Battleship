class Grid
  belongs_to player
  X = [1, 2 ,3 ,4 ,5]
  Y = [1, 2 ,3 ,4 ,5]
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
  grid = [
    [false, false, false, false, false],
    [false, false, false, false, false],
    [false, false, false, false, false],
    [false, false, false, false, false],
    [false, false, false, false, false]
  ]
  def point_of_origin

  end

  def can_position(point_of_origin, position)
    # is the position possible from the point of origin
  end

  def boats_state
    #true if you touch something
  end
  def add_hit(x, y)


  end

end
