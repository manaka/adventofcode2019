require './02.rb'

RSpec.describe GravityAssist, "#fix_program" do
  context "with 1 sum" do
    it "example 1" do
      ga = GravityAssist.new '1,9,10,3,2,3,11,0,99,30,40,50'
      ga.fix_program
      expect(ga.to_a).to eq [3500,9,10,70,2,3,11,0,99,30,40,50]
    end
    it "example 2" do
      ga = GravityAssist.new '1,0,0,0,99'
      ga.fix_program
      expect(ga.to_a).to eq [2,0,0,0,99]
    end
    it "example 3" do
      ga = GravityAssist.new '2,3,0,3,99'
      ga.fix_program
      expect(ga.to_a).to eq [2,3,0,6,99]
    end
    it "example 4" do
      ga = GravityAssist.new '2,4,4,5,99,0'
      ga.fix_program
      expect(ga.to_a).to eq [2,4,4,5,99,9801]
    end
    it "example 5" do
      ga = GravityAssist.new '1,1,1,4,99,5,6,0,99'
      ga.fix_program
      expect(ga.to_a).to eq [30,1,1,4,2,5,6,0,99]
    end
  end

  context "state_before_break" do
    ga = GravityAssist.new '1,1,1,4,99,5,6,0,99'
    ga.state_before_break
      it "should set [1] to 12 and [2] to 2" do
        expect(ga.to_a[1]).to eq 12
        expect(ga.to_a[2]).to eq 2
      end
  end

end
