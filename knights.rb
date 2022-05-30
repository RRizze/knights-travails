#!/usr/bin/sh ruby

module Chess

  def knights_moves(from, to)
    res = []
    res
  end
end

class Board
  attr_reader :board

  def initialize
    @board = [
      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
      'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
    ]
  end

end

board = Board.new
p board.board
