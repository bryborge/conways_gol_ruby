# frozen_string_literal: true

class GameOfLife
  def initialize
    @grid = %w[
      ....................
      ....................
      ......***...........
      ....................
      ....................
      ....................
      ........*****.......
      ....................
      ....................
      ....................
      ....................
      ....................
      ....................
      ....................
      ....................
      ....................
      ....................
      ....................
      ....................
      ....................
    ]  
  end

  def iterate
    puts "\e[H\e[2J" # clear the terminal buffer
    render
    transition
    sleep 0.25
  end

  def transition
    @grid = @grid.each_with_index.map do |row, x|
      row.each_char.each_with_index.map do |cell, y|
        n = count_alive_neighbors(x, y)

        # any alive cell with < 2 live neighbors dies
        if cell == '*' && n < 2
          '.'
        # any living cell with exactly 2 or 3 neighbors will live on
        elsif cell == '*' && (n == 2 || n == 3)
          '*'
        # any living cell with greater than 3 neighbors will die
        elsif cell == '*' && n > 3
          '.'
        # any dead cell with exactly 3 neighbors will become a living cell
        elsif cell == '.' && n == 3
          '*'
        else
          cell
        end
      end.join
    end
  end

  def render
    @grid.each { |row| puts row.split('').join(' ') }
  end

  private

  def count_alive_neighbors(x, y)
    neighbors = [
      [x - 1, y - 1],
      [x - 1, y],
      [x - 1, y + 1],
      [x, y - 1],
      [x, y + 1],
      [x + 1, y - 1],
      [x + 1, y],
      [x + 1, y + 1],
    ]

    neighbors.map do |c|
      next 0 if c[0].negative? || c[1].negative?
      next 0 if c[0] > @grid.size - 1 || c[1] > @grid[0].size - 1

      cell = @grid[c[0]][c[1]]

      cell == '*' ? 1 : 0
    end.sum
  end
end

gol = GameOfLife.new
loop do
  gol.iterate()  
end
