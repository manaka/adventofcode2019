#!/usr/bin/env ruby
# frozen_string_literal: true

require 'awesome_print'
require 'benchmark'


# spacecraft
# fuel
# mass
# elfs




def spacecraft_ready?(mass)
end

def fuel_required(mass)
  fuel = (mass/3.0).floor - 2
  return 0 if fuel < 0

  fuel + fuel_required(fuel)
end

def fuel_mass
  (mass/3.0).floor - 2
end

ap "fuel required 966 == #{fuel_required(1969)}"


# ap "mass = 12; 2 ==  #{fuel_required(12)}"
# ap "mass = 14; 2 ==  #{fuel_required(14)}"
# ap "mass = 1969; 654 ==  #{fuel_required(1969)}"
# ap "mass = 100756; 33583 ==  #{fuel_required(100756)}"

# spacecrafts = File.open('01_src.txt').read().split("\n").map(&:to_i)
# tottal_mass = spacecrafts.map{|e| fuel_required(e) }.sum()
# ap "total mass is #{tottal_mass}"
