#!/usr/bin/env ruby
# frozen_string_literal: true

# Crossed Wires from https://adventofcode.com/2019/day/3
class CrossedWires
  attr_reader :field, :x, :y

  def initialize(wire1, wire2)
    @wire1 = wire1.split(',')
    @wire2 = wire2.split(',')
    @field = Hash.new { |h, k| h[k] = [] }
    @x = 0
    @y = 0
  end

  def intersection_distance
    draw_line(@wire1, 'red')
    reset_position
    draw_line(@wire2, 'green')
    min_path
  end

  def intersections
    @field.select { |_, v| (v & %w[red green]) == %w[red green] }
  end

  def min_path
    intersections.keys.map { |k| [k[0].abs, k[1].abs] }.map(&:sum).min
  end

  private

  def draw_line(wire, color_code)
    current_length = 1
    wire.each do |step|
      direction = step[0]
      wire_length = step[1..-1].to_i
      x_shift, y_shift = get_direction(direction)
      (1..wire_length).each do
        current_length += 1
        @x += x_shift
        @y += y_shift
        @field[[@x, @y]].push(color_code)
      end
    end
  end

  def get_direction(direction)
    case direction
    when 'R'
      [+1, 0]
    when 'L'
      [-1, 0]
    when 'U'
      [0, +1]
    when 'D'
      [0, -1]
    end
  end

  def reset_position
    @x = 0
    @y = 0
  end
end

#require './03_01.rb'
#load './03_01.rb'

#wire1 = 'R8,U5,L5,D3'
#wire2 = 'U7,R6,D4,L4'

input_src = File.open('03_input.txt').read
wire1, wire2 = input_src.split("\n")
cw = CrossedWires.new wire1, wire2
puts cw.intersection_distance

#

#--- Day 3: Crossed Wires ---
#The gravity assist was successful, and you're well on your way to the Venus refuelling station. During the rush back on Earth, the fuel management system wasn't completely installed, so that's next on the priority list.
#
#Opening the front panel reveals a jumble of wires. Specifically, two wires are connected to a central port and extend outward on a grid. You trace the path each wire takes as it leaves the central port, one wire per line of text (your puzzle input).
#
#The wires twist and turn, but the two wires occasionally cross paths. To fix the circuit, you need to find the intersection point closest to the central port. Because the wires are on a grid, use the Manhattan distance for this measurement. While the wires do technically cross right at the central port where they both start, this point does not count, nor does a wire count as crossing with itself.
#
#For example, if the first wire's path is R8,U5,L5,D3, then starting from the central port (o), it goes right 8, up 5, left 5, and finally down 3:
#
#    ...........
#    ...........
#    ...........
#    ....+----+.
#    ....|....|.
#    ....|....|.
#    ....|....|.
#    .........|.
#    .o-------+.
#    ...........
#    Then, if the second wire's path is U7,R6,D4,L4, it goes up 7, right 6, down 4, and left 4:
#
#...........
#.+-----+...
#.|.....|...
#.|..+--X-+.
#.|..|..|.|.
#.|.-X--+.|.
#.|..|....|.
#.|.......|.
#.o-------+.
#...........
#These wires cross at two locations (marked X), but the lower-left one is closer to the central port: its distance is 3 + 3 = 6.
#
#Here are a few more examples:
#
#R75,D30,R83,U83,L12,D49,R71,U7,L72
#U62,R66,U55,R34,D71,R55,D58,R83 = distance 159
#R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51
#U98,R91,D20,R16,D67,R40,U7,R15,U6,R7 = distance 135
#What is the Manhattan distance from the central port to the closest intersection?