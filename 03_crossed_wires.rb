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