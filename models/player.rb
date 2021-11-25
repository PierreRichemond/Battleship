class Player

  def initialize(grid)
    @grid = grid
    @active = false
  end

  def change_active_state
    !@active
  end

  def self.current_player
    Players.where(@active = true)
  end

  def self.switch_active_states
    Player.first.change_active_state
    Player.last.change_active_state
  end

  def self.opponent
    Players.where(@active = false)
  end


end
