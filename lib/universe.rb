require_relative './cell'

class Universe

  NEIGBORS_OFFSETS = [ [-1,0], [-1,-1], [0,-1], [1,-1], [1,0], [1,1], [0,1], [-1,1] ]
  attr_reader :width, :height, :cells

  def initialize(x,y)
    @width, @height = x, y
    x.times { (@cells||=[]) << y.times.map { Cell.new(rand < 0.5) } }
  end

  def output
    cells.map { |row| row.map { |cell| cell.to_s } }
  end

  def cycle
    count_neighbors
    cells.flatten.each(&:cycle)
  end

  def cells_alive
    cells.flatten.inject(0){|sum,cell| sum + (cell.alive? ? 1 : 0) }
  end

  private
  def count_neighbors
    cells.each_with_index do |row,r|
      row.each_with_index do |cell,c|
        cell.living_neighbors=alive_neighbors(c,r)
      end
    end
  end

  def alive_neighbors(row,col)
    count_neigbors_for row, col
  end

  def count_neigbors_for(row,col)
    cnt = 0
    NEIGBORS_OFFSETS.each do |xy|
      x,y = row+xy[0], col+xy[1]
      # next if x < 0 || y < 0 || x >= width || y >= height
      x = width-1 if x < 0
      y = height-1 if y < 0
      x = 0 if x >= width
      y = 0 if y >= height
      cnt += 1 if @cells[y][x].alive?
    end
    cnt
  end

end
