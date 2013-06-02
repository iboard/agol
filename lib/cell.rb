class Cell

  attr_accessor :living_neighbors

  def initialize(alive)
    @alive = alive
  end

  def to_s
    alive? ? '♡' : ' '
  end

  def alive?
    !!@alive
  end

  def die
    @alive = false
  end

  def life
    @alive = true
  end

  def cycle
    if living_neighbors < 2 || living_neighbors > 3
      die
    elsif living_neighbors == 3
      life
    end
  end
end
