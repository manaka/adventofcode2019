# frozen_string_literal: true

require './03_crossed_wires'

RSpec.describe CrossedWires, 'Crossed Wires' do
  context 'intersection_point 2 wires' do
    it 'R8,U5,L5,D3 and U7,R6,D4,L4' do
      cw = CrossedWires.new 'R8,U5,L5,D3', 'U7,R6,D4,L4'
      expect(cw.intersection_distance).to eq 6
    end
    it 'R75,D30,R83,U83,L12,D49,R71,U7,L72 and U62,R66,U55,R34,D71,R55,D58,R83' do
      cw = CrossedWires.new 'R75,D30,R83,U83,L12,D49,R71,U7,L72', 'U62,R66,U55,R34,D71,R55,D58,R83'
      expect(cw.intersection_distance).to eq 159
    end
    it 'R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51 and U98,R91,D20,R16,D67,R40,U7,R15,U6,R7' do
      cw = CrossedWires.new 'R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51', 'U98,R91,D20,R16,D67,R40,U7,R15,U6,R7'
      expect(cw.intersection_distance).to eq 135
    end
    it 'U1,U2,R3,U2,L5 and R4,U1,U1,U1,U3,L3,D5' do
      cw = CrossedWires.new 'U1,U2,R3,U2,L5', 'R4,U1,U1,U1,U3,L3,D5'
      expect(cw.intersection_distance).to eq 4
    end

    context 'minimal signal delay' do
      it 'R8,U5,L5,D3 and U7,R6,D4,L4' do
        cw = CrossedWires.new 'R8,U5,L5,D3', 'U7,R6,D4,L4'
        expect(cw.minimal_signal_delay).to eq 30
      end

      it 'R75,D30,R83,U83,L12,D49,R71,U7,L72 and U62,R66,U55,R34,D71,R55,D58,R83' do
        cw = CrossedWires.new 'R75,D30,R83,U83,L12,D49,R71,U7,L72', 'U62,R66,U55,R34,D71,R55,D58,R83'
        expect(cw.minimal_signal_delay).to eq 610
      end
      it 'R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51 and U98,R91,D20,R16,D67,R40,U7,R15,U6,R7' do
        cw = CrossedWires.new 'R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51', 'U98,R91,D20,R16,D67,R40,U7,R15,U6,R7'
        expect(cw.minimal_signal_delay).to eq 410
      end

    end
  end


end
