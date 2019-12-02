#!/usr/bin/env ruby
# frozen_string_literal: true

# require 'awesome_print'
# require 'benchmark'

# Gravity Assist
class GravityAssist

  def initialize(intcode)
    @memory = intcode.split(',').map(&:to_i)
    @initial_state = @memory.dup
  end

  def fix_program
    pc = @memory.length / 4
    (0..pc).each do |e|
      start_index = e * 4
      opcode = @memory[start_index]
      break if opcode == 99

      if opcode == 1
        @memory[@memory[start_index + 3]] = @memory[@memory[start_index + 1]] + @memory[@memory[start_index + 2]]
      elsif opcode == 2
        @memory[@memory[start_index + 3]] = @memory[@memory[start_index + 1]] * @memory[@memory[start_index + 2]]
      else
        #puts "Error opcode: #{opcode}"
        break
        #raise ArgumentError, 'Wrong opcod'
      end
    end
  end

  def set_state(instruction_1 = 12, instruction_2 = 2)
    @memory[1] = instruction_1
    @memory[2] = instruction_2
  end

  def to_a
    @memory
  end

  def to_s
    @memory.join(', ')
  end

  def reload_it
    @memory = @initial_state.dup
  end

  def result
    @memory[0]
  end

  def initial_state
    @initial_state
  end

end

