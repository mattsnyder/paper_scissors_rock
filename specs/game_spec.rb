require './game'
require 'rspec/given'

# Reporting to players, rules evaluation, multiple games, results

describe Game do
  Spec::Matchers.define :be_a_draw do |expected|
    match do |actual|
      actual.results.draw? == true
    end
  end

  Spec::Matchers.define :be_won_by do |expected|
    match do |game|
      game.results.winner == expected
    end
  end

  def players_decisions(decisions)
    player1.stub(:choose).and_return decisions[:player1]
    player2.stub(:choose).and_return decisions[:player2]
  end
  
  Given (:player1) { mock "player1", :result => true, :choose => mock }
  Given (:player2) { mock "player2", :result => true, :choose => mock }
  Given { Player.stub(:new).and_return player1, player2 }
  
  context "when initialized with mocked players" do
    Given (:game) { Game.new Player, Player }

    context "and rock wins" do
      Given (:rules) { mock :play => :rock }
      Given { RockPaperScissorsRules.stub(:new).and_return rules }
      Given { player1.should_receive(:winning_token).with(:rock).once }
      Given { player2.should_receive(:winning_token).with(:rock).once }
      Then("should notify players") { game.play 1 }
    end
  end
  
end
