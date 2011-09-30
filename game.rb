#!/usr/bin/env ruby

require './player'
require './rock_paper_scissors_rules'
require 'ostruct'

class Game
  def initialize( player1, player2 )
    @player1 = player1.new(player2.to_s)
    @player2 = player2.new(player1.to_s)
    @score1 = 0
    @score2 = 0
  end

  def play( match )
    match.times do
      hand1 = @player1.choose
      hand2 = @player2.choose
      rules = RockPaperScissorsRules.new
      winner = rules.play hand1, hand2
      @player1.winning_token winner
      @player2.winning_token winner
    end
  end

  def results
    OpenStruct.new({
                     :draw? => @score1 == @score2,
                     :winner => @score1 > @score2 ? @player1 : @player2
                   })
  end
    
  def results_old
    match = "#{@player1.class} vs. #{@player2.class}\n" +
      "\t#{@player1.class}: #{@score1}\n" +
      "\t#{@player2.class}: #{@score2}\n"
    if @score1 == @score2
      match + "\tDraw\n"
    elsif @score1 > @score2
      match + "\t#{@player1.class} Wins\n"
    else
      match + "\t#{@player2.class} Wins\n"
    end
  end

  private

  def draw( hand1, hand2 )
    @score1 += 0.5
    @score2 += 0.5
    @player1.result(hand1, hand2, :draw)
    @player2.result(hand2, hand1, :draw)
  end

  def win( winner, hand1, hand2 )
    if winner == @player1
      @score1 += 1
      @player1.result(hand1, hand2, :win)
      @player2.result(hand2, hand1, :lose)
    else
      @score2 += 1
      @player1.result(hand1, hand2, :lose)
      @player2.result(hand2, hand1, :win)
    end
  end
end


