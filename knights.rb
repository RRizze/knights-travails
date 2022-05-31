#!/usr/bin/sh ruby

# For storing as key in hash
Node = Struct.new(:x, :y)

class Graph

  def initialize
    @board = []
    (0..8).each do |x|
      (0..8).each do |y|
        @board.push([x, y])
      end
    end
  end

  def neighbors(node)
    dirs = [
      [1, 2], [-1, 2], [1, -2], [-1, -2],
      [2, 1], [2, -1], [-2, 1], [-2, -1]
    ]
    knight_steps = [2, 1]
    result = []

    dirs.each do |dir|
      neighbor = [
        node[0] + dir[0],
        node[1] + dir[1]
      ]
      if @board.include?(neighbor)
        result.push(neighbor)
      end
    end
    result
  end

  def knights_moves(from, to)
    start = Node.new(from[0], from[1])
    goal = Node.new(to[0], to[1])


    frontier_queue = []
    # path A->B is stored as came_from[B] == A
    came_from = {}
    came_from[start] = nil

    frontier_queue.push(from)

    while !frontier_queue.empty?
      current = frontier_queue.shift()

      if current == to
        break
      end

      neighbors = neighbors(current)

      neighbors.each do |next_node|
        k = Node.new(next_node[0], next_node[1])
        if !came_from.has_key?(k)
          frontier_queue.push(next_node)
          came_from[k] = current
        end
      end
    end

    current = to
    path = []
    while current != from
      path.push(current)
      current = came_from[Node.new(current[0], current[1])]
    end
    path.push(from)
    path.reverse
  end
end

graph = Graph.new

puts "from [0,0] to [1,2]"
p graph.knights_moves([0,0], [1,2])

puts "from [0,0] to [3,3]"
p graph.knights_moves([0,0], [3,3])

puts "from [3,3] to [0,0]"
p graph.knights_moves([3,3], [0,0])
#p graph.neighbors([3,3])
#p board.board
#p all_nodes
