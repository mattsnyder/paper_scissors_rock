require './rock_paper_scissors_rules'

describe RockPaperScissorsRules do

  describe "#play" do
    Given (:game) { RockPaperScissorsRules.new }
    describe "when rock plays scissors" do
      Then { game.play(:rock, :scissors).should == :rock }
    end

    describe "when rock plays paper" do
      Then { game.play(:rock, :paper).should == :paper }
    end

    describe "when paper plays scissors" do
      Then { game.play(:paper, :scissors).should == :scissors } 
    end

    describe "when rock plays rock" do
      Then { game.play(:rock, :rock).should be_nil } 
    end
  end
  
end
